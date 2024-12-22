import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/src/features/weather/domain/entities/aqi_entity.dart';
 
part 'aqi_model.g.dart';

@JsonSerializable()
class AqiModel extends AqiEntity {
  final double? co;
  final double? no2;
  final double? o3;
  final double? so2;
  final double? pm2_5;
  final double? pm10;
  @JsonKey(name: 'us-epa-index')
  final int? usEpaIndex;
  @JsonKey(name: 'gb-defra-index')
  final int? gbDefraIndex;

  AqiModel({
    required this.co,
    required this.no2,
    required this.o3,
    required this.so2,
    required this.pm2_5,
    required this.pm10,
    required this.usEpaIndex,
    required this.gbDefraIndex,
  }) : super(
          co: co,
          no2: no2,
          o3: o3,
          so2: so2,
          pm2_5: pm2_5,
          pm10: pm10,
          usEpaIndex: usEpaIndex,
          gbDefraIndex: gbDefraIndex,
        );

  /// Creates a copy of the current model with optional new values
  AqiModel copyWith({
    double? co,
    double? no2,
    double? o3,
    double? so2,
    double? pm2_5,
    double? pm10,
    int? usEpaIndex,
    int? gbDefraIndex,
  }) =>
      AqiModel(
        co: co ?? this.co,
        no2: no2 ?? this.no2,
        o3: o3 ?? this.o3,
        so2: so2 ?? this.so2,
        pm2_5: pm2_5 ?? this.pm2_5,
        pm10: pm10 ?? this.pm10,
        usEpaIndex: usEpaIndex ?? this.usEpaIndex,
        gbDefraIndex: gbDefraIndex ?? this.gbDefraIndex,
      );

  /// Factory constructor to create an instance from JSON
  factory AqiModel.fromJson(Map<String, dynamic> json) =>
      _$AqiModelFromJson(json);

  /// Converts the current instance to JSON
  Map<String, dynamic> toJson() => _$AqiModelToJson(this);
}
