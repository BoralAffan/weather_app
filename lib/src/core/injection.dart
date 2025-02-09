import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:weather_app/src/features/weather/data/datasource/weather_remote_data_source.dart';
import 'package:weather_app/src/features/weather/data/repositories/weather_repository_impl.dart';
import 'package:weather_app/src/features/weather/domain/repositories/weather_repository.dart';
import 'package:weather_app/src/features/weather/domain/usecases/get_city_suggestion_usecase.dart';
import 'package:weather_app/src/features/weather/domain/usecases/get_device_location_usecase.dart';
import 'package:weather_app/src/features/weather/domain/usecases/get_location_by_ip_usecase.dart';
import 'package:weather_app/src/features/weather/domain/usecases/get_location_permission_usecase.dart';
import 'package:weather_app/src/features/weather/domain/usecases/get_weather_usecase.dart';
import 'package:weather_app/src/features/weather/presentation/blocs/weather/weather_bloc.dart';
 

final sl = GetIt.instance; // Service Locator

Future<void> init() async {
  // External Dependencies
  sl.registerLazySingleton(() => Dio());

  // Data Sources
  sl.registerLazySingleton<WeatherRemoteDataSource>(
    () => WeatherRemoteDataSourceImpl(client: sl()),
  );

  // Repositories
  sl.registerLazySingleton<WeatherRepository>(
    () => WeatherRepositoryImpl(remoteDataSource: sl()),
  );

  // Use Cases
  sl.registerLazySingleton(() => GetWeatherUsecase(repository: sl()));
    sl.registerLazySingleton(() => GetDeviceLocationUseCase());
  sl.registerLazySingleton(() => GetLocationPermissionUseCase());
  sl.registerLazySingleton(() => FetchLocationByIPUseCase(repository: sl()));
  sl.registerLazySingleton(() => GetCitySuggestionsUseCase(weatherRepository: sl()));

  // Blocs
  sl.registerFactory(() => WeatherBloc(getWeatherUseCase: sl(),getCitySuggestionsUseCase: sl()));
}
