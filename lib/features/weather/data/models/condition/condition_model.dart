
import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/features/weather/domain/entities/condition_entity.dart';

part 'condition_model.g.dart';

@JsonSerializable()
class ConditionModel extends ConditionEntity  {
      final String text;
    final String icon;
   final  int code;

    ConditionModel({
        required this.text,
        required this.icon,
        required this.code,
    }) : super(text: text, icon: icon, code: code);

    ConditionModel copyWith({
        String? text,
        String? icon,
        int? code,
    }) => 
        ConditionModel(
            text: text ?? this.text,
            icon: icon ?? this.icon,
            code: code ?? this.code,
        );


        
  /// Factory constructor to create an instance from JSON
  factory ConditionModel.fromJson(Map<String, dynamic> json) =>
      _$ConditionModelFromJson(json);

  /// Converts the current instance to JSON
  Map<String, dynamic> toJson() => _$ConditionModelToJson(this);
}