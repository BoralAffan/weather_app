import 'package:equatable/equatable.dart';

class ConditionEntity extends Equatable {
    final String text;
    final String icon;
    final int code;
    ConditionEntity({
    required this.text,
    required this.icon,
    required this.code,
 
  });
  @override
  List<Object?> get props => [text,icon,code];
}
