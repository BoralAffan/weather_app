 
import 'package:equatable/equatable.dart';
import 'package:weather_app/src/features/weather/data/models/city_suggestion/city_suggestion_model.dart';
import 'package:weather_app/src/features/weather/domain/entities/weather_entity.dart';

abstract class WeatherState extends Equatable {
    WeatherState({this.citySuggestions, this.weather,this.searchedWeather, this.searchedWeatherError,this.weatherError});

   final WeatherEntity? weather;
  final List<CitySuggestionModel>? citySuggestions;
  final WeatherEntity? searchedWeather;
final String? weatherError;
final String? searchedWeatherError;
  @override
  List<Object?> get props => [weather, citySuggestions, searchedWeather,weatherError,searchedWeatherError];
}

class WeatherInitial extends WeatherState {
  WeatherInitial({WeatherEntity? weather, List<CitySuggestionModel>? citySuggestions, WeatherEntity? searchedWeather, String? weatherError, String? searchedWeatherError})
      : super(weather: weather, citySuggestions: citySuggestions, searchedWeather: searchedWeather,searchedWeatherError: searchedWeatherError,weatherError: weatherError);

  @override
  List<Object?> get props => [];
  
  @override
  WeatherState copyWith({WeatherEntity? weather, List<CitySuggestionModel>? citySuggestions, WeatherEntity? searchedWeather,String? weatherError, String? searchedWeatherError}) {
    return WeatherInitial(
      weather: weather ?? this.weather,
      citySuggestions: citySuggestions ?? this.citySuggestions,
      searchedWeather: searchedWeather ?? this.searchedWeather,
      searchedWeatherError: searchedWeatherError?? this.searchedWeatherError,
      weatherError: weatherError?? this.weatherError
    );
  }
}


class WeatherLoading extends WeatherState {
   WeatherLoading({WeatherEntity? weather, List<CitySuggestionModel>? citySuggestions, WeatherEntity? searchedWeather})
      : super(weather: weather, citySuggestions: citySuggestions, searchedWeather: searchedWeather);

  @override
  WeatherState copyWith({WeatherEntity? weather, List<CitySuggestionModel>? citySuggestions, WeatherEntity? searchedWeather}) {
    return WeatherLoading(
      weather: weather ?? this.weather,
      citySuggestions: citySuggestions ?? this.citySuggestions,
      searchedWeather: searchedWeather ?? this.searchedWeather,
    );
  }
}


class WeatherLoaded extends WeatherState {
  final WeatherEntity weather;
  final List<CitySuggestionModel>? citySuggestions;
  final WeatherEntity? searchedWeather;

  WeatherLoaded({required this.weather, this.citySuggestions, this.searchedWeather});

  @override
  List<Object?> get props => [weather, citySuggestions, searchedWeather];

  @override
  WeatherState copyWith({WeatherEntity? weather, List<CitySuggestionModel>? citySuggestions, WeatherEntity? searchedWeather}) {
    return WeatherLoaded(
      weather: weather ?? this.weather,
      citySuggestions: citySuggestions ?? this.citySuggestions,
      searchedWeather: searchedWeather ?? this.searchedWeather,
    );
  }
}

class WeatherError extends WeatherState {
    WeatherError({WeatherEntity? weather, List<CitySuggestionModel>? citySuggestions, WeatherEntity? searchedWeather,String? weatherError, String? searchedWeatherError})
      : super(weather: weather, citySuggestions: citySuggestions, searchedWeather: searchedWeather,searchedWeatherError: searchedWeatherError,weatherError: weatherError);

  @override
  WeatherState copyWith({WeatherEntity? weather, List<CitySuggestionModel>? citySuggestions, WeatherEntity? searchedWeather,String? weatherError, String? searchedWeatherError}) {
    return WeatherError(
      weather: weather ?? this.weather,
      citySuggestions: citySuggestions ?? this.citySuggestions,
      searchedWeather: searchedWeather ?? this.searchedWeather,
            searchedWeatherError: searchedWeatherError?? this.searchedWeatherError,
      weatherError: weatherError?? this.weatherError
    );
  }
}


class SearchedWeatherLoading extends WeatherState {
   SearchedWeatherLoading({WeatherEntity? weather, List<CitySuggestionModel>? citySuggestions, WeatherEntity? searchedWeather})
      : super(weather: weather, citySuggestions: citySuggestions, searchedWeather: searchedWeather);

  @override
  WeatherState copyWith({WeatherEntity? weather, List<CitySuggestionModel>? citySuggestions, WeatherEntity? searchedWeather}) {
    return SearchedWeatherLoading(
      weather: weather ?? this.weather,
      citySuggestions: citySuggestions ?? this.citySuggestions,
      searchedWeather: searchedWeather ?? this.searchedWeather,
    );
  }
}


class SearchedWeatherLoaded extends WeatherState {
  final WeatherEntity? weather;
  final List<CitySuggestionModel>? citySuggestions;
  final WeatherEntity? searchedWeather;

  SearchedWeatherLoaded({  this.weather, this.citySuggestions, this.searchedWeather});

  @override
  List<Object?> get props => [weather, citySuggestions, searchedWeather];

  @override
  WeatherState copyWith({WeatherEntity? weather, List<CitySuggestionModel>? citySuggestions, WeatherEntity? searchedWeather}) {
    return SearchedWeatherLoaded(
      weather: weather ?? this.weather,
      citySuggestions: citySuggestions ?? this.citySuggestions,
      searchedWeather: searchedWeather ?? this.searchedWeather,
    );
  }
}

class SearchedWeatherError extends WeatherState {
    SearchedWeatherError({WeatherEntity? weather, List<CitySuggestionModel>? citySuggestions, WeatherEntity? searchedWeather, String? weatherError, String? searchedWeatherError})
      : super(weather: weather, citySuggestions: citySuggestions, searchedWeather: searchedWeather,searchedWeatherError: searchedWeatherError,weatherError: weatherError);

  @override
  WeatherState copyWith({WeatherEntity? weather, List<CitySuggestionModel>? citySuggestions, WeatherEntity? searchedWeather,String? weatherError, String? searchedWeatherError}) {
    return SearchedWeatherError(
      weather: weather ?? this.weather,
      citySuggestions: citySuggestions ?? this.citySuggestions,
            searchedWeather: searchedWeather ?? this.searchedWeather,
   searchedWeatherError: searchedWeatherError?? this.searchedWeatherError,
      weatherError: weatherError?? this.weatherError  );
  }
}



class CitySuggestionsLoaded extends WeatherState {
  final List<CitySuggestionModel> suggestions;

  CitySuggestionsLoaded({required this.suggestions, WeatherEntity? weather, WeatherEntity? searchedWeather})
      : super(weather: weather, searchedWeather: searchedWeather);

  @override
  List<Object?> get props => [suggestions, weather, searchedWeather];

  @override
  WeatherState copyWith({WeatherEntity? weather, List<CitySuggestionModel>? citySuggestions, WeatherEntity? searchedWeather}) {
    return CitySuggestionsLoaded(
      suggestions: citySuggestions ?? this.citySuggestions!,
      weather: weather ?? this.weather,
      searchedWeather: searchedWeather ?? this.searchedWeather,
    );
  }
}

