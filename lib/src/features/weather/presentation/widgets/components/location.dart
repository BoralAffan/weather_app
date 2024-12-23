import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/src/core/utils/image_paths.dart';
import 'package:weather_app/src/features/weather/presentation/blocs/weather/weather_bloc.dart';
import 'package:weather_app/src/routes/routes.dart';

class LocationWidget extends StatelessWidget {
  String city;
  WeatherBloc weatherBloc;
  bool? showUnderLineText;
  String date;
   LocationWidget({super.key, required this.city, required this.date, required this.weatherBloc, this.showUnderLineText=true});
  
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,

      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 0.6.sw,
              child: Text(
                         
               city,
                style:   TextStyle(
                    height: 0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 22.sp),
              ),
            ),
            Text(
              date,
              style: TextStyle(
                  color: Colors.grey.withOpacity(.7),
                  fontSize: 11.sp,
                  fontWeight: FontWeight.bold),
            ),
        showUnderLineText??false ?    GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, RouteGenerator.search,arguments: weatherBloc,);
              },
               child: Text(
                "Browse Weather by city?",
                
                style: TextStyle(
                  decoration: TextDecoration.underline,
                    color: Colors.grey.withOpacity(.7),
                    fontSize: 11.sp,
                    fontWeight: FontWeight.bold),
                           ),
             ): SizedBox()
          ],
        ),
      const Spacer(),
        SizedBox(
          height: 125.h,
          width: 125.w,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ClipRRect(borderRadius :BorderRadius.circular(20.r) ,child: Image.asset(ImagePaths.map,fit: BoxFit.cover,)),
          ),
        )
      ],
    );
  }
}
