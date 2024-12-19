import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/features/weather/data/models/aqi/aqi_model.dart';
import 'package:weather_app/features/weather/data/models/condition/condition_model.dart';
  import 'package:weather_app/features/weather/domain/entities/hourly_forecast_entity.dart';

part 'hourly_forecast_model.g.dart';

@JsonSerializable()
class HourlyForecastModel extends HourlyForecastEntity {
  @JsonKey(name: 'time_epoch')
  final int timeEpoch;
  
  @JsonKey(name: 'time')
  final String time;
  
  @JsonKey(name: 'temp_c')
  final double tempC;
  
  @JsonKey(name: 'temp_f')
  final double tempF;
  
  @JsonKey(name: 'is_day')
  final int isDay;
  
  @JsonKey(name: 'condition')
  final ConditionModel condition;
  
  @JsonKey(name: 'wind_mph')
  final double windMph;
  
  @JsonKey(name: 'wind_kph')
  final double windKph;
  
  @JsonKey(name: 'wind_degree')
  final int windDegree;
  
  @JsonKey(name: 'wind_dir')
  final String windDir;
  
  @JsonKey(name: 'pressure_mb')
  final double pressureMb;
  
  @JsonKey(name: 'pressure_in')
  final double pressureIn;
  
  @JsonKey(name: 'precip_mm')
  final double precipMm;
  
  @JsonKey(name: 'precip_in')
  final double precipIn;
  
  @JsonKey(name: 'snow_cm')
  final double snowCm;
  
  @JsonKey(name: 'humidity')
  final int humidity;
  
  @JsonKey(name: 'cloud')
  final int cloud;
  
  @JsonKey(name: 'feelslike_c')
  final double feelslikeC;
  
  @JsonKey(name: 'feelslike_f')
  final double feelslikeF;
  
  @JsonKey(name: 'windchill_c')
  final double windchillC;
  
  @JsonKey(name: 'windchill_f')
  final double windchillF;
  
  @JsonKey(name: 'heatindex_c')
  final double heatindexC;
  
  @JsonKey(name: 'heatindex_f')
  final double heatindexF;
  
  @JsonKey(name: 'dewpoint_c')
  final double dewpointC;
  
  @JsonKey(name: 'dewpoint_f')
  final double dewpointF;
  
  @JsonKey(name: 'will_it_rain')
  final int willItRain;
  
  @JsonKey(name: 'chance_of_rain')
  final int chanceOfRain;
  
  @JsonKey(name: 'will_it_snow')
  final int willItSnow;
  
  @JsonKey(name: 'chance_of_snow')
  final int chanceOfSnow;
  
  @JsonKey(name: 'vis_km')
  final double visKm;
  
  @JsonKey(name: 'vis_miles')
  final double visMiles;
  
  @JsonKey(name: 'gust_mph')
  final double gustMph;
  
  @JsonKey(name: 'gust_kph')
  final double gustKph;
  
  @JsonKey(name: 'uv')
  final double uv;
  
  @JsonKey(name: 'air_quality')
  final AqiModel airQuality;

  const HourlyForecastModel({
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
  }) : super(
          timeEpoch: timeEpoch,
          time: time,
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
          snowCm: snowCm,
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
          willItRain: willItRain,
          chanceOfRain: chanceOfRain,
          willItSnow: willItSnow,
          chanceOfSnow: chanceOfSnow,
          visKm: visKm,
          visMiles: visMiles,
          gustMph: gustMph,
          gustKph: gustKph,
          uv: uv,
          airQuality: airQuality,
        );

  factory HourlyForecastModel.fromJson(Map<String, dynamic> json) =>
      _$HourlyForecastModelFromJson(json);

  Map<String, dynamic> toJson() => _$HourlyForecastModelToJson(this);
}
