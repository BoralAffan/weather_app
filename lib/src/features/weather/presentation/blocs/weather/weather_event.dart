part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}
class FetchWeather extends WeatherEvent{
  String city;
  FetchWeather({required this.city});
}

class FetchCitySuggestions extends WeatherEvent {
  final String query;
  FetchCitySuggestions({required this.query});
}


class FetchSearchedWeather extends WeatherEvent {
  final String query;
  FetchSearchedWeather({required this.query});
}

class RemoveSearchedWeatherData extends WeatherEvent{}