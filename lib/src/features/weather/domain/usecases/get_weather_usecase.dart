import 'package:dartz/dartz.dart';
import 'package:weather_app/src/core/errors/failures.dart';
import 'package:weather_app/src/features/weather/domain/entities/weather_entity.dart';
import 'package:weather_app/src/features/weather/domain/repositories/weather_repository.dart';

class GetWeatherUsecase{
final WeatherRepository repository;
GetWeatherUsecase({required this.repository});
  Future<Either<Failure,WeatherEntity>> call (String city){
    return repository.getWeather(city);
  }
}