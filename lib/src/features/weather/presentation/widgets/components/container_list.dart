import 'package:flutter/material.dart';
import 'package:weather_app/src/core/utils/image_paths.dart';
import 'package:weather_app/src/features/weather/presentation/widgets/components/small_container.dart';
    class ContainerList extends StatelessWidget {
  ContainerList({super.key});
   @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
            SmallContainer(text: '10 %', image: ImagePaths.heavyRain),
           SmallContainer(text : ' 30 km/h',image : ImagePaths.wind),
            SmallContainer(text :'30 %', image :ImagePaths.sun),
        ],
      ),
    );
  }
}


