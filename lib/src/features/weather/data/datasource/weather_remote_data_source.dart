import 'package:dio/dio.dart';
import 'package:weather_app/src/core/errors/exceptions.dart';
import 'package:weather_app/src/features/weather/data/models/weather/weather_model.dart';

abstract class WeatherRemoteDataSource {
  Future<WeatherModel> getWeather(String city);
}

class WeatherRemoteDataSourceImpl extends WeatherRemoteDataSource {
  Dio client;
  WeatherRemoteDataSourceImpl({required this.client});

  @override
  Future<WeatherModel> getWeather(String city) async{
    try {
      print('calling here');
      WeatherModel weather;
      var response = await client.get(
        'http://api.weatherapi.com/v1/forecast.json?key=b9d8e18b8dad456b918140126241912&q=${city}&days=7&aqi=yes&alerts=no');

print('response data ${response.data}');
 if(response.statusCode==200){
weather = WeatherModel.fromJson(response.data);
// print('response data json ${weather}');
 

return weather;
}      throw ServerException();
    } catch (e) {
      print('exception ${e}');
      throw ServerException();
    }
  }
}
