import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/src/features/weather/data/models/current_weather/current_weather_model.dart';
import 'package:weather_app/src/features/weather/data/models/hourly_forecast/hourly_forecast_model.dart';
import 'package:weather_app/src/features/weather/domain/entities/forecast_entity.dart';
 

part 'forecast_model.g.dart';

@JsonSerializable()
class ForecastModel extends ForecastEntity {
  @JsonKey(name: 'date')
  final String? date;

  @JsonKey(name: 'date_epoch')
  final int? dateEpoch;

  @JsonKey(name: 'day')
  final CurrentWeatherModel? day;

  @JsonKey(name: 'hour')
  final List<HourlyForecastModel>? hour;

  const ForecastModel({
    required this.date,
    required this.dateEpoch,
    required this.day,
    required this.hour,
  }) : super(
          date: date,
          dateEpoch: dateEpoch,
          day: day,
          hour: hour,
        );

  factory ForecastModel.fromJson(Map<String, dynamic> json) =>
      _$ForecastModelFromJson(json);

  Map<String, dynamic> toJson() => _$ForecastModelToJson(this);
}
