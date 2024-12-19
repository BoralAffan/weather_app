import 'package:weather_app/src/features/weather/domain/entities/current_weather_entity.dart';
 import 'package:equatable/equatable.dart';
import 'package:weather_app/src/features/weather/domain/entities/hourly_forecast_entity.dart';

class ForecastEntity extends Equatable {
  final String date;
  final int dateEpoch;
  final CurrentWeatherEntity day;
  final List<HourlyForecastEntity> hour;

  const ForecastEntity({
    required this.date,
    required this.dateEpoch,
    required this.day,
    required this.hour,
  });

  @override
  List<Object?> get props => [date, dateEpoch, day, hour];
}
