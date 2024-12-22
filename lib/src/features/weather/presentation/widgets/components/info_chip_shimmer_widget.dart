import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:weather_app/src/core/utils/app_colors.dart';

class InfoChipShimmerWidget extends StatelessWidget {
  const InfoChipShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Shimmer for the container
        Shimmer.fromColors(
          baseColor: AppColors.greyColor,
          highlightColor:  AppColors.lightGreyColor,
          child: Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        const SizedBox(height: 4),
        // Shimmer for the text
        Shimmer.fromColors(
          baseColor: AppColors.greyColor,
          highlightColor: AppColors.lightGreyColor,
          child: Container(
            height: 15,
            width: 50, 
            color: AppColors.greyColor,
          ),
        ),
      ],
    );
  }
}
