import 'package:weather_app/src/features/weather/data/models/ip_location/ip_location_model.dart';
import 'package:weather_app/src/features/weather/domain/repositories/weather_repository.dart';

class FetchLocationByIPUseCase {
  final WeatherRepository repository;

  FetchLocationByIPUseCase({required this.repository});

  Future<String> execute() async {
    return await repository.fetchLocationByIP();
  }
}
