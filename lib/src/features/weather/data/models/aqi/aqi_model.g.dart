// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aqi_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AqiModel _$AqiModelFromJson(Map<String, dynamic> json) => AqiModel(
      co: (json['co'] as num).toDouble(),
      no2: (json['no2'] as num).toDouble(),
      o3: (json['o3'] as num).toDouble(),
      so2: (json['so2'] as num).toDouble(),
      pm2_5: (json['pm2_5'] as num).toDouble(),
      pm10: (json['pm10'] as num).toDouble(),
      usEpaIndex: (json['us-epa-index'] as num).toInt(),
      gbDefraIndex: (json['gb-defra-index'] as num).toInt(),
    );

Map<String, dynamic> _$AqiModelToJson(AqiModel instance) => <String, dynamic>{
      'co': instance.co,
      'no2': instance.no2,
      'o3': instance.o3,
      'so2': instance.so2,
      'pm2_5': instance.pm2_5,
      'pm10': instance.pm10,
      'us-epa-index': instance.usEpaIndex,
      'gb-defra-index': instance.gbDefraIndex,
    };
