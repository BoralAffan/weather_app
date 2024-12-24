import 'package:dartz/dartz.dart';
import 'package:weather_app/src/core/errors/failures.dart';
import 'package:weather_app/src/features/weather/data/models/city_suggestion/city_suggestion_model.dart';
import 'package:weather_app/src/features/weather/data/models/ip_location/ip_location_model.dart';
import 'package:weather_app/src/features/weather/domain/entities/weather_entity.dart';

abstract class WeatherRepository{
    Future<Either<Failure,WeatherEntity>> getWeather(String city);
  Future<String> fetchLocationByIP();
  // Future<List<CitySuggestionModel>> getCitySuggestions(String city);

}