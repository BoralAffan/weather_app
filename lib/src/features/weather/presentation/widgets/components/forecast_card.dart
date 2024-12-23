import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/src/core/utils/helpers.dart';

class ForecastCard extends StatelessWidget {
  String minTemp;
  String maxTemp;
  String imgUrl;
  String date;
  ForecastCard(
      {super.key,
      required this.minTemp,
      required this.maxTemp,
      required this.imgUrl,
      required this.date});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      width: double.infinity,
      margin: EdgeInsets.all(2),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade300, blurRadius: 1, spreadRadius: 0.5)
          ]),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 0.35.sw,
               child: Text(
                Helpers.formatDateToDayMonth(date),
                style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
              ),
            ),
            RichText(
                text: TextSpan(
                    text: '${minTemp}\u00B0/',
                    style: TextStyle(
                        color: const Color.fromARGB(255, 192, 181, 181),
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp),
                    children: [
                  TextSpan(
                    text: '${maxTemp}\u00B0',
                    style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp),
                  )
                ])),
            Image.network('https:${imgUrl}')
          ],
        ),
      ),
    );
  }
}
