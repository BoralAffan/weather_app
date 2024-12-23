import 'package:weather_app/src/features/weather/data/models/city_suggestion/city_suggestion_model.dart';
import 'package:weather_app/src/features/weather/domain/repositories/weather_repository.dart';

class GetCitySuggestionsUseCase {
  final WeatherRepository weatherRepository;

  GetCitySuggestionsUseCase({required this.weatherRepository});

  // Future<List<CitySuggestionModel>> execute(String query) async {
  //   return await weatherRepository.getCitySuggestions(query);
  // }
}