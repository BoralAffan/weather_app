import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
 import 'package:weather_app/src/routes/routes.dart';
import 'package:weather_app/src/core/injection.dart' as di;

void main() async{

    WidgetsFlutterBinding.ensureInitialized();

   await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

   @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812), 
      minTextAdapt: true,              
      builder: (context,child) {
        return MaterialApp(
          title: 'Weather App',
        initialRoute: RouteGenerator.home,
          onGenerateRoute: RouteGenerator.generateRoute,
          
          
        );
      }
    );
  }
}

 