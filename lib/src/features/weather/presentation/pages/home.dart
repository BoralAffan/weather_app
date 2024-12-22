import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/features/weather/presentation/blocs/weather/weather_bloc.dart';
import 'package:weather_app/src/features/weather/presentation/widgets/components/app_bar.dart';
import 'package:weather_app/src/features/weather/presentation/widgets/components/container_list.dart';
import 'package:weather_app/src/features/weather/presentation/widgets/components/hours_list.dart';
import 'package:weather_app/src/features/weather/presentation/widgets/components/info_card.dart';
import 'package:weather_app/src/features/weather/presentation/widgets/components/location.dart';

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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
             
              Location(),
              Hero(
                  tag: 'TAG',
                  child: Material(
                      color: Colors.transparent,
                      child: InfoCard())),
              ContainerList(),
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
                      Spacer(),
                      Text(
                        'Next 14 Days >',
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      )
                    ],
                  ),
                ),
              ),
              HoursList(),
            ],
          ),
        ),
      ),
    );
  }
}