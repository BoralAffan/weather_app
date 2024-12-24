import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/src/core/utils/helpers.dart';
import 'package:weather_app/src/features/weather/presentation/blocs/weather/weather_bloc.dart';
import 'package:weather_app/src/features/weather/presentation/blocs/weather/weather_state.dart';
import 'package:weather_app/src/features/weather/presentation/widgets/components/forecast_card.dart';
import 'package:weather_app/src/features/weather/presentation/widgets/components/hours_shimmer_widget.dart';
import 'package:weather_app/src/features/weather/presentation/widgets/components/hours_widget.dart';
import 'package:weather_app/src/features/weather/presentation/widgets/components/info_card.dart';
import 'package:weather_app/src/features/weather/presentation/widgets/components/info_card_shimmer.dart';
import 'package:weather_app/src/features/weather/presentation/widgets/components/info_list.dart';
import 'package:weather_app/src/features/weather/presentation/widgets/components/info_list_shimmer.dart';
import 'package:weather_app/src/features/weather/presentation/widgets/components/location.dart';
import 'package:weather_app/src/features/weather/presentation/widgets/components/location_shimmer.dart';

class SearchPage extends StatefulWidget {
  WeatherBloc weatherBLoc;
  SearchPage({super.key, required this.weatherBLoc});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _controller = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    _controller.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (val) {
        widget.weatherBLoc.add(RemoveSearchedWeatherData());
      },
      child: Scaffold(
        body: SafeArea(
          child: BlocProvider.value(
            value: widget.weatherBLoc,
            child: BlocBuilder<WeatherBloc, WeatherState>(
              builder: (context, state) {
                return SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      child: Column(children: [
                        Container(
                          height: 50.h,
                          width: 1.sw,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [BoxShadow(blurRadius: 0.1)],
                              borderRadius: BorderRadius.circular(10.r)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    controller: _controller,
                                    decoration: InputDecoration.collapsed(
                                        hintText: 'Enter city'),
                                    onChanged: (value) {},
                                    onSubmitted: (value) {
                                      widget.weatherBLoc.add(
                                          FetchSearchedWeather(query: value));
                                    },
                                  ),
                                ),
                                IconButton(
                                    onPressed: () {
                                      if (_controller.text.isNotEmpty) {
                                        widget.weatherBLoc.add(
                                            FetchSearchedWeather(
                                                query:
                                                    _controller.text.trim()));
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                content:
                                                    Text('Please enter city')));
                                      }
                                    },
                                    icon: Icon(Icons.search))
                              ],
                            ),
                          ),
                        ),
                        _controller.text.isEmpty
                            ? SizedBox(
                                height: 0.75.sh,
                                width: 1.sw,
                                child: Center(
                                  child: Text('search city '),
                                ))
                            : state is SearchedWeatherLoading
                                ? Column(
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
                                  )
                                : state.searchedWeather?.location != null
                                    ? Column(
                                        children: [
                                          LocationWidget(
                                            weatherBloc:
                                                context.read<WeatherBloc>(),
                                            showUnderLineText: false,
                                            city:
                                                '${state.searchedWeather?.location?.name} , ${state.searchedWeather?.location?.country}' ??
                                                    '',
                                            date: Helpers.formatDate(state
                                                    .searchedWeather
                                                    ?.location
                                                    ?.localtime ??
                                                ''),
                                          ),
                                          Material(
                                              color: Colors.transparent,
                                              child: InfoCard(
                                                condition: state
                                                        .searchedWeather
                                                        ?.current
                                                        ?.condition
                                                        ?.text ??
                                                    '',
                                                feelsLike: state
                                                    .searchedWeather!
                                                    .current!
                                                    .feelslikeC
                                                    .toString(),
                                                temp: state.searchedWeather!
                                                    .current!.tempC
                                                    .toString(),
                                                time: Helpers.extractTime(state
                                                        .searchedWeather!
                                                        .location!
                                                        .localtime ??
                                                    ''),
                                              )),
                                          InfoListWidget(
                                            cloud: state
                                                .searchedWeather!.current!.cloud
                                                .toString(),
                                            humidity: state.searchedWeather!
                                                .current!.humidity
                                                .toString(),
                                            wind: state.searchedWeather!
                                                .current!.windKph!
                                                .toString(),
                                          ),
                                          SizedBox(
                                            height: 20.h,
                                          ),
                                          GestureDetector(
                                            onTap: () => {},
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    'Today',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 22.sp),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          HoursWidget(
                                            forcasts: state
                                                    .searchedWeather!
                                                    .forecast!
                                                    .forecasts?[0]
                                                    .hour ??
                                                [],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
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
                                            children: state.searchedWeather!
                                                .forecast!.forecasts!
                                                .map((forecast) {
                                              return Column(
                                                children: [
                                                  ForecastCard(
                                                      minTemp: forecast
                                                          .day!.minTempC
                                                          .toString(),
                                                      maxTemp: forecast
                                                          .day!.maxTempC
                                                          .toString(),
                                                      imgUrl: forecast
                                                              .day
                                                              ?.condition
                                                              ?.icon ??
                                                          '',
                                                      date:
                                                          forecast.date ?? ''),
                                                  SizedBox(
                                                    height: 20.h,
                                                  )
                                                ],
                                              );
                                            }).toList(),
                                          ),
                                          SizedBox(
                                            height: 30.h,
                                          )
                                        ],
                                      )
                                    : SizedBox(
                                        height: 0.75.sh,
                                        width: 1.sw,
                                        child: Center(
                                          child: Text(
                                              "No Data found for the entered location"),
                                        ))
                      ]),
                    ));
              },
            ),
          ),
        ),
      ),
    );
  }
}
