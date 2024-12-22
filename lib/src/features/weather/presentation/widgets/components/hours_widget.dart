import 'package:flutter/material.dart';
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
 
          print('default ${Helpers.extractTime(forcasts[index].time??'')}'+"  "+"now ${currentTime.hour.toString()}");
          return GestureDetector(
            onTap: () => {},
            child: Column(    // for ignoring parent height
              children: [
                // Obx(() =>
                 Card(
                  elevation: 10,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  shadowColor : 
                  // controller.compareIndex(index) ?
                  Colors.blue 
                  // :Colors.
                  ,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  child: Container(
                    height: 130,
                    width: 80,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                        color:   Helpers.extractTime(forcasts[index].time??'').contains(currentTime.hour.toString())? Colors.blue: Colors.grey.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(50)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                          Text(
                          Helpers.extractTime(forcasts[index].time??''),
                          style:  TextStyle(
                            color: Helpers.extractTime(forcasts[index].time??'').contains(currentTime.hour.toString())? Colors.white: Color.fromARGB(255, 56, 55, 55),
                            fontSize: 12,
                            fontWeight: Helpers.extractTime(forcasts[index].time??'').contains(currentTime.hour.toString())? FontWeight.bold: FontWeight.w500,
                        
                        ),),
                        Container(
                             height: 50,
                            width: 50,
                          child: Image.network(  "https:${forcasts[index].condition?.icon}")
                        ),
                        Text(
                          
                              '${forcasts[index].tempC.toString()}\u00B0',
                          style:  TextStyle(
                              color: const Color.fromARGB(255, 192, 181, 181) ,
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
