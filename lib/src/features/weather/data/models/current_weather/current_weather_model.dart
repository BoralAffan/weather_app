// ignore_for_file: overridden_fields

import 'package:json_annotation/json_annotation.dart';

import 'package:weather_app/src/features/weather/data/models/aqi/aqi_model.dart';
import 'package:weather_app/src/features/weather/data/models/condition/condition_model.dart';
import 'package:weather_app/src/features/weather/domain/entities/current_weather_entity.dart';

part 'current_weather_model.g.dart';

@JsonSerializable()
class CurrentWeatherModel extends CurrentWeatherEntity {
   
  @JsonKey(name: 'last_updated_epoch')
  final int? lastUpdatedEpoch;

   
  @JsonKey(name: 'last_updated')
  final String? lastUpdated;

   
  @JsonKey(name: 'temp_c')
  final double? tempC;

   
  @JsonKey(name: 'temp_f')
  final double? tempF;

   
  @JsonKey(name: 'is_day')
  final int? isDay;

   
  final ConditionModel? condition;

   
  @JsonKey(name: 'wind_mph')
  final double? windMph;

   
  @JsonKey(name: 'wind_kph')
  final double? windKph;

   
  @JsonKey(name: 'wind_degree')
  final int? windDegree;

   
  @JsonKey(name: 'wind_dir')
  final String? windDir;

   
  @JsonKey(name: 'pressure_mb')
  final double? pressureMb;

   
  @JsonKey(name: 'pressure_in')
  final double? pressureIn;

   
  @JsonKey(name: 'precip_mm')
  final double? precipMm;

   
  @JsonKey(name: 'precip_in')
  final double? precipIn;

   
  final int? humidity;

   
  final int? cloud;

   
  @JsonKey(name: 'feelslike_c')
  final double? feelslikeC;

     @JsonKey(name: 'maxtemp_c')
  final double? maxTempC;

  @JsonKey(name: 'mintemp_c')
  final double? minTempC;

  @JsonKey(name: 'feelslike_f')
  final double? feelslikeF;

   
  @JsonKey(name: 'windchill_c')
  final double? windchillC;

   
  @JsonKey(name: 'windchill_f')
  final double? windchillF;

   
  @JsonKey(name: 'heatindex_c')
  final double? heatindexC;

   
  @JsonKey(name: 'heatindex_f')
  final double? heatindexF;

   
  @JsonKey(name: 'dewpoint_c')
  final double? dewpointC;

   
  @JsonKey(name: 'dewpoint_f')
  final double? dewpointF;

   
  @JsonKey(name: 'vis_km')
  final double? visKm;

   
  @JsonKey(name: 'vis_miles')
  final double? visMiles;

   
  final double? uv;

   
  @JsonKey(name: 'gust_mph')
  final double? gustMph;

   
  @JsonKey(name: 'gust_kph')
  final double? gustKph;
   
 
  

   @JsonKey(name: 'air_quality')
  final AqiModel? airQuality;

  CurrentWeatherModel(
      {required this.lastUpdatedEpoch,
      required this.lastUpdated,
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
      required this.visKm,
      required this.visMiles,
      required this.uv,
      required this.gustMph,
      required this.gustKph,
      required this.airQuality,
      required this.maxTempC,
      required this.minTempC,
  
      })
      : super(
            lastUpdatedEpoch: lastUpdatedEpoch,
            lastUpdated: lastUpdated,
            tempC: tempC,
            tempF: tempF,
            isDay: isDay,
            condition: condition,
            windMph: windMph,
            windKph: windKph,
            windDegree: windDegree,
            windDir: windDir,
            pressureMb: pressureMb,
            pressureIn: pressureIn,
            precipMm: precipMm,
            precipIn: precipIn,
            humidity: humidity,
            cloud: cloud,
            feelslikeC: feelslikeC,
            feelslikeF: feelslikeF,
            windchillC: windchillC,
            windchillF: windchillF,
            heatindexC: heatindexC,
            heatindexF: heatindexF,
            dewpointC: dewpointC,
            dewpointF: dewpointF,
            visKm: visKm,
            visMiles: visMiles,
            uv: uv,
            gustMph: gustMph,
            gustKph: gustKph,
            airQuality: airQuality,
            maxTempC: maxTempC,
            minTempC: minTempC
   
            );

  factory CurrentWeatherModel.fromJson(Map<String, dynamic> json) =>
      _$CurrentWeatherModelFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentWeatherModelToJson(this);
}
