import 'package:dartz/dartz.dart';
import 'package:weather_app/src/core/errors/failures.dart';
import 'package:weather_app/src/features/weather/domain/entities/weather_entity.dart';

abstract class WeatherRepository{
    Future<Either<Failure,WeatherEntity>> getWeather(String city);

}