// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast_day_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForecastDayModel _$ForecastDayModelFromJson(Map<String, dynamic> json) =>
    ForecastDayModel(
      forecastday: (json['forecastday'] as List<dynamic>)
          .map((e) => ForecastModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ForecastDayModelToJson(ForecastDayModel instance) =>
    <String, dynamic>{
      'forecastday': instance.forecastday,
    };
