import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/core/utils/helpers.dart';
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
    context.read<WeatherBloc>().add(FetchWeather(city: 'Mumbai'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: BlocConsumer<WeatherBloc, WeatherState>(
            listener: (context, state) {
              // TODO: implement listener
              print('state changed ${state}');
            },
            builder: (context, state) {
              return BlocBuilder<WeatherBloc, WeatherState>(
                builder: (context, state) {
                  if (state is WeatherLoading) {
                    return Column(
                      children: [
                        LocationShimmerWidget(),
                        Hero(
                            tag: 'TAG',
                            child: Material(
                                color: Colors.transparent,
                                child: InfoCardShimmerWidget())),
                        InfoListShimmerWidget(),
                        SizedBox(
                          height: 40,
                        ),
                        HoursShimmerWidget()
                      ],
                    );
                  }

                  else if (state is WeatherLoaded)
return SingleChildScrollView(
  scrollDirection: Axis.vertical,
  child: Column(
                        children: [
                          LocationWidget(
                            city: state.weather.location?.name ?? '',
                            date: Helpers.formatDate(
                                state.weather.location?.localtime ?? ''),
                          ),
                          Hero(
                              tag: 'TAG',
                              child: Material(
                                  color: Colors.transparent, child: InfoCard(
                                    condition: state.weather.current?.condition?.text??'',
                                    feelsLike:state.weather.current!.feelslikeC.toString(),
                                    temp: state.weather.current!.tempC.toString(),
                                    time: Helpers.extractTime(state.weather.location?.localtime??''),
                                  ))),
                          InfoListWidget(
                            cloud: state.weather.current!.cloud.toString(),humidity: state.weather.current!.humidity.toString(),wind: state.weather.current!.windKph!.toString(),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: () => {},
                            child: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                children: [
                                  Text(
                                    'Today',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25),
                                  ),
                                  
                             
                                ],
                              ),
                            ),
                          ),
                          HoursWidget(forcasts: state.weather.forecast!.forecasts?[0].hour??[],),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                        'Forecast',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25),
                                      ),
                              ],
                            ),
Column(children: 
state.weather.forecast!.forecasts!.map((forecast){
  return ForecastCard(minTemp: forecast.day!.minTempC.toString(),maxTemp: forecast.day!.maxTempC.toString(), imgUrl: forecast.day?.condition?.icon??'', date: forecast.date??'');
}
).toList()
,),
 
SizedBox(height: 30,)
                        ],
                      ),
);

                else   if (state is WeatherError) {
                    return Center(
                      child: Text('Something went wrong'),
                    );
                  }

                  return SizedBox();
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
