   import 'package:weather_app/src/features/weather/domain/entities/current_weather_entity.dart';
import 'package:weather_app/src/features/weather/domain/entities/forecast_day_entity.dart';
import 'package:weather_app/src/features/weather/domain/entities/location_entity.dart';
import 'package:equatable/equatable.dart';

class WeatherEntity extends Equatable {
  final LocationEntity? location;
  final CurrentWeatherEntity? current;
  final  ForecastDayEntity?  forecast;

  const WeatherEntity({
    required this.location,
    required this.current,
    required this.forecast,
  });

  @override
  List<Object?> get props => [location, current, forecast];
}
