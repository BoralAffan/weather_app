import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app/src/features/weather/domain/usecases/get_weather_usecase.dart';
import 'package:weather_app/src/features/weather/presentation/blocs/weather/weather_state.dart';
 
part 'weather_event.dart';
 
class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  GetWeatherUsecase getWeatherUseCase;
  WeatherBloc({required this.getWeatherUseCase}) : super(WeatherInitial()) {
    on<FetchWeather>((event, emit)async{
emit(WeatherLoading());
var weather = await getWeatherUseCase(event.city);
weather.fold((error)=>emit(WeatherError()), (success){emit(WeatherLoaded(weather: success));});
    });
  }
}
