import 'package:dartz/dartz.dart';
import 'package:weather_app/src/core/errors/exceptions.dart';
import 'package:weather_app/src/core/errors/failures.dart';
import 'package:weather_app/src/features/weather/data/datasource/weather_remote_data_source.dart';
import 'package:weather_app/src/features/weather/data/models/city_suggestion/city_suggestion_model.dart';
import 'package:weather_app/src/features/weather/data/models/ip_location/ip_location_model.dart';
import 'package:weather_app/src/features/weather/data/models/weather/weather_model.dart';
import 'package:weather_app/src/features/weather/domain/repositories/weather_repository.dart';

class WeatherRepositoryImpl extends WeatherRepository {
  final WeatherRemoteDataSource remoteDataSource;
  WeatherRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, WeatherModel>> getWeather(String city) async{
    try {
       final weather = await remoteDataSource.getWeather(city);
      
       return Right(weather);
    }   catch (e) {
       return Right(WeatherModel(location: null, current: null, forecast: null));
    }
  }
   @override
  Future<String> fetchLocationByIP() async {
    return await remoteDataSource.fetchLocationByIP();
  }

  //   @override
  // Future<List<CitySuggestionModel>> getCitySuggestions(String city) async {
  //   return await remoteDataSource.getCitySuggestions(city);
  // }
}
