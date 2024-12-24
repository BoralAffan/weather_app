import 'package:weather_app/src/core/utils/constants.dart';

class ApiEntpoints{
static String getWeatherUrl(String city){
  return 'http://api.weatherapi.com/v1/forecast.json?key=${AppConstants.apiKey}&q=${city}&days=7&aqi=yes&alerts=no';
}

static String getUserIp = 'https://api64.ipify.org?format=json';
 static String getLocationByIp(String userIp){

  return 'https://ipwho.is/$userIp';
  
}
}