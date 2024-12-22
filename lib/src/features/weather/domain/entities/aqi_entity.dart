import 'package:equatable/equatable.dart';

class AqiEntity extends Equatable {
  final double? co;  
  final double? no2;  
  final double? o3;  
  final double? so2;  
  final double? pm2_5;  
  final double? pm10;  
  final int? usEpaIndex;  
  final int? gbDefraIndex;  

  AqiEntity({
    required this.co,
    required this.no2,
    required this.o3,
    required this.so2,
    required this.pm2_5,
    required this.pm10,
    required this.usEpaIndex,
    required this.gbDefraIndex,
  });

  @override
  List<Object?> get props => [
        co,
        no2,
        o3,
        so2,
        pm2_5,
        pm10,
        usEpaIndex,
        gbDefraIndex,
      ];
}
