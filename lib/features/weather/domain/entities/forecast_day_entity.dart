import 'package:weather_app/features/weather/domain/entities/current_weather_entity.dart';
import 'package:weather_app/features/weather/domain/entities/forecast_entity.dart';
import 'package:weather_app/features/weather/domain/entities/hourly_forecast_entity.dart';
import 'package:equatable/equatable.dart';

class ForecastDayEntity extends Equatable {
 
  final List<ForecastEntity> forecasts;

  const ForecastDayEntity({
 
    required this.forecasts,
  });

  @override
  List<Object?> get props => [  forecasts];
}
