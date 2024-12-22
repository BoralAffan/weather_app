import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/core/utils/image_paths.dart';
import 'package:weather_app/src/features/weather/presentation/blocs/weather/weather_bloc.dart';
import 'package:weather_app/src/features/weather/presentation/widgets/components/info_chip_container.dart';
    class InfoListWidget extends StatelessWidget {
      String cloud;
      String wind;
      String humidity;
  InfoListWidget({super.key, required this.cloud, required this.humidity, required this.wind});
   @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
            InfoChipContainerWiget(text: '${cloud} %', image: ImagePaths.starts),
           InfoChipContainerWiget(text : ' $wind km/h',image : ImagePaths.wind),
            InfoChipContainerWiget(text :'$humidity %', image :ImagePaths.sun),
        ],
      ),
    );
  }
}


