import 'package:json_annotation/json_annotation.dart';
 import 'package:weather_app/src/features/weather/data/models/forecast/forecast_model.dart';
import 'package:weather_app/src/features/weather/domain/entities/forecast_day_entity.dart';
 
part 'forecast_day_model.g.dart';

@JsonSerializable()
class ForecastDayModel extends ForecastDayEntity {
  @JsonKey(name: 'forecastday')
  final List<ForecastModel> forecastday;

 
  const ForecastDayModel({
    required this.forecastday,
  
  }) : super(
 forecasts: forecastday
        );

  factory ForecastDayModel.fromJson(Map<String, dynamic> json) =>
      _$ForecastDayModelFromJson(json);

  Map<String, dynamic> toJson() => _$ForecastDayModelToJson(this);
}
