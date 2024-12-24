import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app/src/features/weather/domain/usecases/get_city_suggestion_usecase.dart';
import 'package:weather_app/src/features/weather/domain/usecases/get_weather_usecase.dart';
import 'package:weather_app/src/features/weather/presentation/blocs/weather/weather_state.dart';
 
part 'weather_event.dart';
 
class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final GetWeatherUsecase getWeatherUseCase;
  final GetCitySuggestionsUseCase getCitySuggestionsUseCase;

  WeatherBloc({
    required this.getWeatherUseCase,
    required this.getCitySuggestionsUseCase,
  }) : super(WeatherInitial()) {
     on<FetchWeather>((event, emit) async {
      emit(WeatherLoading());
      var weather = await getWeatherUseCase(event.city);
      weather.fold(
        (error) => emit(WeatherError()),
        (success) => emit(WeatherLoaded(weather: success)),
      );
    });

      on<FetchSearchedWeather>((event, emit) async {
      emit(SearchedWeatherLoading(citySuggestions: state.citySuggestions,searchedWeather: state.searchedWeather,weather: state.weather));
      var weather = await getWeatherUseCase(event.query);
      weather.fold(
        (error) => emit(SearchedWeatherLoaded(citySuggestions: state.citySuggestions,searchedWeather:null ,weather: state.weather,)),
        (success) => emit(SearchedWeatherLoaded(searchedWeather: success,citySuggestions: state.citySuggestions,weather: state.weather)),
      );
    });
    on<RemoveSearchedWeatherData>((event, emit) async {
            emit(WeatherLoaded(weather: state.weather!, citySuggestions: state.citySuggestions,searchedWeather: null));

    });
       on<InitiateProcessEvent>((event, emit) async {
            emit(WeatherLoading());

    });
// on<FetchCitySuggestions>((event, emit) async {
//       if (event.query.isEmpty) {
//          return;
//       }

       
//       try {
//         final suggestions = await getCitySuggestionsUseCase.execute(event.query);
//         emit(CitySuggestionsLoaded(
//           suggestions: suggestions,
//           weather: state.weather,
//           searchedWeather: state.searchedWeather,
//         ));
//       } catch (e) {
//         print('exveption $e');
//         emit(WeatherError(weather: state.weather, citySuggestions: state.citySuggestions, searchedWeather: state.searchedWeather));
//       }
//     });
 
  }
}

