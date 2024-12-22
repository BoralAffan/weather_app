import 'package:flutter/material.dart';
import 'package:weather_app/src/features/weather/presentation/pages/home.dart';
import 'package:weather_app/src/routes/routes.dart';
import 'package:weather_app/src/core/injection.dart' as di;

void main() async{

    WidgetsFlutterBinding.ensureInitialized();

   // Initialize Dependency Injection
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
    initialRoute: RouteGenerator.home,
      onGenerateRoute: RouteGenerator.generateRoute,
      
      
    );
  }
}

 