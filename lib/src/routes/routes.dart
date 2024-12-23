import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/features/weather/presentation/blocs/weather/weather_bloc.dart';
import 'package:weather_app/src/features/weather/presentation/pages/search.dart';
import 'package:weather_app/src/core/injection.dart';
import 'package:weather_app/src/features/weather/presentation/pages/home.dart';

class RouteGenerator {
  static const String home = '/';

  static const String search = '/search';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (_) => sl<WeatherBloc>(),
                  child: HomePage(),
                ));
      case search:
        WeatherBloc bloc = settings.arguments as WeatherBloc;
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
create: (_) => sl<WeatherBloc>(),                  child: SearchPage(
                    weatherBLoc: bloc,
                  ),
                ));
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Error'),
          ),
          body: const Center(
            child: Text('Page not found!'),
          ),
        );
      },
    );
  }
}
