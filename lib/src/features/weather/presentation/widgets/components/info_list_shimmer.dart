import 'package:flutter/material.dart';
import 'package:weather_app/src/core/utils/image_paths.dart';
import 'package:weather_app/src/features/weather/presentation/widgets/components/info_chip_shimmer_widget.dart';
import 'package:weather_app/src/features/weather/presentation/widgets/components/info_chip_container.dart';
    class InfoListShimmerWidget extends StatelessWidget {
  InfoListShimmerWidget({super.key});
   @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
            InfoChipShimmerWidget(),
            InfoChipShimmerWidget(),
            InfoChipShimmerWidget(),
          ],
      ),
    );
  }
}


