import 'package:flutter/material.dart';
import 'package:weather_app/src/core/utils/image_paths.dart';

class Location extends StatelessWidget {
   Location({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              // controller.getAddress(),
              'Mumbai',
              style: const TextStyle(
                  height: 0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
            Text(
              // Utils.formateDate(DateTime.now()),
              '24, July',
              style: TextStyle(
                  color: Colors.grey.withOpacity(.7),
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
        const Spacer(),
        SizedBox(
          height: 150,
          width: 150,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ClipRRect(borderRadius :BorderRadius.circular(20) ,child: Image.asset(ImagePaths.map,fit: BoxFit.cover,)),
          ),
        )
      ],
    );
  }
}
