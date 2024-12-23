import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/src/core/utils/image_paths.dart';

class InfoCard extends StatelessWidget {
  String time;
  String condition;
  String temp;
  String feelsLike;
  InfoCard({super.key, required this.time, required this.condition,required this.temp, required this.feelsLike});
  @override
  Widget build(BuildContext context) {
      String _getImageBasedOnTime(String time) {
    final extractedTime = time.split(':');
    final hour = int.tryParse(extractedTime[0]) ?? 0;
      if (hour >= 6 && hour < 18 ) {
      return 'assets/images/sun.png';  
    } else {
      return 'assets/images/moon.png'; 
    }
  }

    var size = MediaQuery.sizeOf(context);
    return SizedBox(
      height: 220.h,
      width: size.width,
      child: Container(
        height: 180.h,
        margin: const EdgeInsets.only(bottom: 30),
        width: size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.blue.withOpacity(.7),
              Colors.blue,
              Colors.blue,
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
               Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    _getImageBasedOnTime(time),
                    height: 80.h,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    condition,
                    style:   TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 22.sp,
                    ),
                  ),
                    SizedBox(height: 5.h),
                  Text(
                    time,
                    style: TextStyle(
                      color: Colors.white.withOpacity(.8),
                      fontWeight: FontWeight.bold,
                      fontSize: 12.sp,
                    ),
                  ),
                ],
              ),
              // Right Column
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.white,
                          Colors.white.withOpacity(.1),
                        ],
                      ).createShader(bounds);
                    },
                    child:   Text(
                    temp,
                      style: TextStyle(
                        fontSize: 50.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                    Text(
                    'Feels like ${feelsLike}',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 40.h,
                    width: 60.w,
                    child: ShaderMask(
                      shaderCallback: (Rect bounds) {
                        return LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.white,
                            Colors.white.withOpacity(.1),
                          ],
                        ).createShader(bounds);
                      },
                      child: Image.asset(
                        ImagePaths.windWave,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
