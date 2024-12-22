 
import 'package:equatable/equatable.dart';
import 'package:weather_app/src/features/weather/domain/entities/forecast_entity.dart';
 
class ForecastDayEntity extends Equatable {
 
  final List<ForecastEntity>? forecasts;

  const ForecastDayEntity({
 
    required this.forecasts,
  });

  @override
  List<Object?> get props => [  forecasts];
}
