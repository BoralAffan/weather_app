import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:weather_app/src/core/errors/exceptions.dart';
import 'package:weather_app/src/core/errors/failures.dart';
import 'package:weather_app/src/features/weather/data/models/city_suggestion/city_suggestion_model.dart';
import 'package:weather_app/src/features/weather/data/models/ip_location/ip_location_model.dart';
import 'package:weather_app/src/features/weather/data/models/weather/weather_model.dart';

abstract class WeatherRemoteDataSource {
  Future<WeatherModel> getWeather(String city);
  Future<IPLocation> fetchLocationByIP();
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
          'http://api.weatherapi.com/v1/forecast.json?key=b9d8e18b8dad456b918140126241912&q=${city}&days=7&aqi=yes&alerts=no');

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
    } catch (e) {
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
    final response = await client.get('https://api64.ipify.org?format=json');

    if (response.statusCode == 200) {
      final json = jsonDecode(response.data);
      return json['ip'];
    } else {
      throw Exception('Failed to fetch user IP');
    }
  }

  Future<IPLocation> fetchLocationByIP() async {
    final userIP = await fetchUserIP();

    final response = await client.get('https://ipapi.co/$userIP/json/');

    if (response.statusCode == 200) {
      final json = jsonDecode(response.data);
      return IPLocation.fromJson(json);
    } else {
      throw Exception('Failed to fetch location by IP');
    }
  }
}
