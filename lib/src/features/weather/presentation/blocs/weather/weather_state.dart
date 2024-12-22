 
import 'package:equatable/equatable.dart';
import 'package:weather_app/src/features/weather/domain/entities/weather_entity.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();
  
  @override
  List<Object> get props => [];
}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState{}
class WeatherLoaded extends WeatherState{
  WeatherEntity weather;
  WeatherLoaded({required this.weather});
}
class WeatherError extends WeatherState{}
