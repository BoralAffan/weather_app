import 'package:equatable/equatable.dart';
import 'package:weather_app/src/features/weather/domain/entities/aqi_entity.dart';
import 'package:weather_app/src/features/weather/domain/entities/condition_entity.dart';
 
class HourlyForecastEntity extends Equatable {
  final int    ?  timeEpoch;
  final String ?     time;
  final double ?     tempC;
  final double ?    tempF;
  final int    ?    isDay;
  final ConditionEntity? condition;
  final double? windMph;
  final double? windKph;
  final int? windDegree;
  final String? windDir;
  final double? pressureMb;
  final double? pressureIn;
  final double? precipMm;
  final double? precipIn;
  final double? snowCm;
  final int? humidity;
  final int? cloud;
  final double? feelslikeC;
  final double? feelslikeF;
  final double? windchillC;
  final double? windchillF;
  final double? heatindexC;
  final double? heatindexF;
  final double? dewpointC;
  final double? dewpointF;
  final int? willItRain;
  final int? chanceOfRain;
  final int? willItSnow;
  final int? chanceOfSnow;
  final double? visKm;
  final double? visMiles;
  final double? gustMph;
  final double? gustKph;
  final double? uv;
  final AqiEntity? airQuality;

  const HourlyForecastEntity({
    required this.timeEpoch,
    required this.time,
    required this.tempC,
    required this.tempF,
    required this.isDay,
    required this.condition,
    required this.windMph,
    required this.windKph,
    required this.windDegree,
    required this.windDir,
    required this.pressureMb,
    required this.pressureIn,
    required this.precipMm,
    required this.precipIn,
    required this.snowCm,
    required this.humidity,
    required this.cloud,
    required this.feelslikeC,
    required this.feelslikeF,
    required this.windchillC,
    required this.windchillF,
    required this.heatindexC,
    required this.heatindexF,
    required this.dewpointC,
    required this.dewpointF,
    required this.willItRain,
    required this.chanceOfRain,
    required this.willItSnow,
    required this.chanceOfSnow,
    required this.visKm,
    required this.visMiles,
    required this.gustMph,
    required this.gustKph,
    required this.uv,
    required this.airQuality,
  });

  @override
  List<Object?> get props => [
        timeEpoch,
        time,
        tempC,
        tempF,
        isDay,
        condition,
        windMph,
        windKph,
        windDegree,
        windDir,
        pressureMb,
        pressureIn,
        precipMm,
        precipIn,
        snowCm,
        humidity,
        cloud,
        feelslikeC,
        feelslikeF,
        windchillC,
        windchillF,
        heatindexC,
        heatindexF,
        dewpointC,
        dewpointF,
        willItRain,
        chanceOfRain,
        willItSnow,
        chanceOfSnow,
        visKm,
        visMiles,
        gustMph,
        gustKph,
        uv,
        airQuality,
      ];
}
