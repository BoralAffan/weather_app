import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:weather_app/src/core/errors/exceptions.dart';
import 'package:weather_app/src/core/errors/failures.dart';
import 'package:weather_app/src/core/utils/endpoints.dart';
import 'package:weather_app/src/features/weather/data/models/city_suggestion/city_suggestion_model.dart';
import 'package:weather_app/src/features/weather/data/models/ip_location/ip_location_model.dart';
import 'package:weather_app/src/features/weather/data/models/weather/weather_model.dart';

abstract class WeatherRemoteDataSource {
  Future<WeatherModel> getWeather(String city);
  Future<String> fetchLocationByIP();
  // Future<List<CitySuggestionModel>> getCitySuggestions(String city);
}

class WeatherRemoteDataSourceImpl extends WeatherRemoteDataSource {
  Dio client;
  WeatherRemoteDataSourceImpl({required this.client});

  @override
  Future<WeatherModel> getWeather(String city) async {
    try {
      WeatherModel weather;
      // this urls can be moved to .env files for extra security
      var response = await client.get(
          ApiEntpoints.getWeatherUrl(city));

      if (response.statusCode == 200) {
        weather = WeatherModel.fromJson(response.data);

        return weather;
      }

      if (response.statusCode == 400) {
        throw ServerFailure(
            error: response.data['error']['message'] ?? 'something went wrong');
      }
      throw ServerFailure(
          error: response.data['error']['message'] ?? 'something went wrong');
    } on DioException catch (e) {
      if (e.response?.data['error']['message'] ==
          'No matching location found.') {
         throw (error: 'No data found for the entered location');
      }
    }
    throw ServerFailure(error: 'something went wrong');
  }
  // }
// tried showing cities suggestion but unable to do it due to time constraints
//   final String geoNamesUsername = 'strangerinmars';

//   Future<List<CitySuggestionModel>> getCitySuggestions(String query) async {
//     final response = await client.get(
//       'http://api.geonames.org/searchJSON?name_startsWith=$query&maxRows=10&username=$geoNamesUsername',
//     );

//      if (response.statusCode == 200) {
//     final data = jsonDecode(response.data);
//      final geonames = data['geonames'] as List;

//     List<CitySuggestionModel> cities = geonames
//         .map((cityData) => CitySuggestionModel.fromJson(cityData))
//         .toList();
// print('cities ${cities}');
//     return cities;
//   } else {
//     throw Exception('Failed to load city suggestions');
//   }
  // }

Future<String> fetchUserIP() async {
    try {
       final response = await Dio().get(ApiEntpoints.getUserIp);
 

       if (response.statusCode == 200) {
         if (response.data is Map<String, dynamic>) {
         
          return response.data['ip'];
        } else {
         }
      } else {
       }
    } catch (e) {
     }

     return '';
  }
  Future<String> fetchLocationByIP() async {
    final userIP = await fetchUserIP();
      final response = await client.get(ApiEntpoints.getLocationByIp(userIP));
 try{
    if (response.statusCode == 200) {
         return response.data['city'];
      } else {
        throw Exception('Failed to fetch location by IP');
      }
} on DioException 

catch(e){
   throw Exception('Failed to fetch location by IP');
}
  
  }
}
