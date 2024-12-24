import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/src/core/utils/helpers.dart';

import 'package:weather_app/src/features/weather/domain/entities/forecast_entity.dart';
import 'package:weather_app/src/features/weather/domain/entities/hourly_forecast_entity.dart';

class HoursWidget extends StatelessWidget {
  List<HourlyForecastEntity> forcasts;
  HoursWidget({super.key, required this.forcasts});
  @override
  Widget build(BuildContext context) {
    TimeOfDay currentTime = TimeOfDay.now();
    return SizedBox(
      height: 180,
      child: ListView.builder(
        itemCount: forcasts.length,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(vertical: 10),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => {},
            child: Column(
              children: [
                Card(
                  elevation: 10,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  shadowColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  child: Container(
                      height: 130.h,
                      width: 80.w,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                          color: Helpers.extractTime(forcasts[index].time ?? '')
                                  .contains(currentTime.hour.toString())
                              ? Colors.blue
                              : Colors.grey.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(50)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            Helpers.extractTime(forcasts[index].time ?? ''),
                            style: TextStyle(
                              color: Helpers.extractTime(
                                          forcasts[index].time ?? '')
                                      .contains(currentTime.hour.toString())
                                  ? Colors.white
                                  : Color.fromARGB(255, 56, 55, 55),
                              fontSize: 12,
                              fontWeight: Helpers.extractTime(
                                          forcasts[index].time ?? '')
                                      .contains(currentTime.hour.toString())
                                  ? FontWeight.bold
                                  : FontWeight.w500,
                            ),
                          ),
                          Container(
                              height: 50.h,
                              width: 50.w,
                              child: Image.network(
                                "https:${forcasts[index].condition?.icon}",
                                loadingBuilder: (BuildContext context,
                                    Widget child,
                                    ImageChunkEvent? loadingProgress) {
                                  if (loadingProgress == null) {
                                    return child; // Image is fully loaded
                                  }
                                  return Center(
                                    child: CircularProgressIndicator(
                                      backgroundColor: Colors.blue,
                                      value:
                                          loadingProgress.expectedTotalBytes !=
                                                  null
                                              ? loadingProgress
                                                      .cumulativeBytesLoaded /
                                                  (loadingProgress
                                                          .expectedTotalBytes ??
                                                      1)
                                              : null,
                                    ),
                                  );
                                },
                                errorBuilder: (BuildContext context,
                                    Object error, StackTrace? stackTrace) {
                                  return Icon(
                                    Icons.image_not_supported,
                                    size: 50,
                                    color: Colors.black,
                                  );
                                },
                              )),
                          Text(
                            '${forcasts[index].tempC.toString()}\u00B0',
                            style: TextStyle(
                                color: const Color.fromARGB(255, 192, 181, 181),
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ],
                      )),
                ),
                // )
              ],
            ),
          );
        },
      ),
    );
  }
}
