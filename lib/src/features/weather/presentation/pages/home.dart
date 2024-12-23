import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/src/core/utils/helpers.dart';
import 'package:weather_app/src/features/weather/data/datasource/weather_remote_data_source.dart';
import 'package:weather_app/src/features/weather/data/repositories/weather_repository_impl.dart';
import 'package:weather_app/src/features/weather/domain/repositories/weather_repository.dart';
import 'package:weather_app/src/features/weather/domain/usecases/get_device_location_usecase.dart';
import 'package:weather_app/src/features/weather/domain/usecases/get_location_by_ip_usecase.dart';
import 'package:weather_app/src/features/weather/domain/usecases/get_location_permission_usecase.dart';
import 'package:weather_app/src/features/weather/presentation/blocs/weather/weather_bloc.dart';
import 'package:weather_app/src/features/weather/presentation/blocs/weather/weather_state.dart';
import 'package:weather_app/src/features/weather/presentation/widgets/components/forecast_card.dart';
import 'package:weather_app/src/features/weather/presentation/widgets/components/hours_shimmer_widget.dart';
import 'package:weather_app/src/features/weather/presentation/widgets/components/info_list.dart';
import 'package:weather_app/src/features/weather/presentation/widgets/components/hours_widget.dart';
import 'package:weather_app/src/features/weather/presentation/widgets/components/info_card.dart';
import 'package:weather_app/src/features/weather/presentation/widgets/components/info_card_shimmer.dart';
import 'package:weather_app/src/features/weather/presentation/widgets/components/info_list_shimmer.dart';
import 'package:weather_app/src/features/weather/presentation/widgets/components/location.dart';
import 'package:weather_app/src/features/weather/presentation/widgets/components/location_shimmer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    // context.read<WeatherBloc>().add(FetchWeather(city: 'Mumbai'));
    _determineWeather();
    super.initState();
  }
      Future<void> _determineWeather() async {
  final locationPermissionGranted = await GetLocationPermissionUseCase().execute();

  if (locationPermissionGranted) {
    final userLocation = await GetDeviceLocationUseCase().execute();
     context.read<WeatherBloc>().add(
      FetchWeather(city: userLocation.city),
    );
  } else {
        final remoteDataSource = WeatherRemoteDataSourceImpl(client: Dio());

    final weatherRepository = WeatherRepositoryImpl(remoteDataSource: remoteDataSource);
    final ipLocation = await FetchLocationByIPUseCase(repository: weatherRepository).execute();
     context.read<WeatherBloc>().add(
      FetchWeather(city: ipLocation.city),
    );
  }
}

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding:   EdgeInsets.symmetric(horizontal: 12.w),
          child: BlocConsumer<WeatherBloc, WeatherState>(
            listener: (context, state) {
              // TODO: implement listener
             },
            builder: (context, state) {
              return BlocBuilder<WeatherBloc, WeatherState>(
                builder: (context, state) {
                  if (state is WeatherLoading) {
                    return Column(
                      children: [
                        const LocationShimmerWidget(),
                        Material(
                                color: Colors.transparent,
                                child: InfoCardShimmerWidget()),
                        InfoListShimmerWidget(),
                          SizedBox(
                          height: 40.h,
                        ),
                          HoursShimmerWidget()
                      ],
                    );
                  } else if (state.weather!=null){
                    return SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                           LocationWidget(
                            weatherBloc: context.read<WeatherBloc>(),
                            city: '${state.weather?.location?.name } , ${state.weather?.location?.country}'?? '',
                            date: Helpers.formatDate(
                                state.weather?.location?.localtime ?? ''),
                          ),

                        Material(
                                  color: Colors.transparent,
                                  child: InfoCard(
                                    condition: state
                                            .weather?.current?.condition?.text ??
                                        '',
                                    feelsLike: state.weather!.current!.feelslikeC
                                        .toString(),
                                    temp:
                                        state.weather!.current!.tempC.toString(),
                                    time: Helpers.extractTime(
                                        state.weather!.location?.localtime ??
                                            ''),
                                  )),
                          InfoListWidget(
                            cloud: state.weather!.current!.cloud.toString(),
                            humidity:
                                state.weather!.current!.humidity.toString(),
                            wind: state.weather!.current!.windKph!.toString(),
                          ),
                            SizedBox(
                            height: 20.h,
                          ),
                          GestureDetector(
                            onTap: () => {},
                            child:   Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                children: [
                                  Text(
                                    'Today',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22.sp),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          HoursWidget(
                            forcasts:
                                state.weather!.forecast!.forecasts?[0].hour ??
                                    [],
                          ),
                            Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Forecast',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22.sp),
                              ),
                            ],
                          ),
                          Column(
                            children: state.weather!.forecast!.forecasts!
                                .map((forecast) {
                              return Column(
                                children: [
                                  ForecastCard(
                                      minTemp: forecast.day!.minTempC.toString(),
                                      maxTemp: forecast.day!.maxTempC.toString(),
                                      imgUrl: forecast.day?.condition?.icon ?? '',
                                      date: forecast.date ?? ''),
                                        SizedBox(height: 20.h,)
                                ],
                              );
                            }).toList(),
                          ),
                            SizedBox(
                            height: 30.h,
                          )
                        ],
                      ),
                    );
                }  else if (state is WeatherError) {
                    return   Center(
                      child: Text(state.weatherError??''),
                    );
                  }

                  return const SizedBox();
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
