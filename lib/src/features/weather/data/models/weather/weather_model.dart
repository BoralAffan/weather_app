import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/src/features/weather/data/models/current_weather/current_weather_model.dart';
import 'package:weather_app/src/features/weather/data/models/forecast_day/forecast_day_model.dart';
import 'package:weather_app/src/features/weather/data/models/location/location_model.dart';
import 'package:weather_app/src/features/weather/domain/entities/weather_entity.dart';
 
 

part 'weather_model.g.dart';

@JsonSerializable()
class WeatherModel extends WeatherEntity {
  @JsonKey(name: 'location')
  final LocationModel? location;

  @JsonKey(name: 'current')
  final CurrentWeatherModel? current;

  @JsonKey(name: 'forecast')
  final ForecastDayModel? forecast;

  const WeatherModel({
    required this.location,
    required this.current,
    required this.forecast,
  }) : super(
          location: location,
          current: current,
          forecast: forecast,
        );

  factory WeatherModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherModelFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherModelToJson(this);
}
 
 