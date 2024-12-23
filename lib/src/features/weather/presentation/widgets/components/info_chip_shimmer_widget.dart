import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
            height: 60.h,
            width: 60.w,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
          SizedBox(height: 5.h),
        // Shimmer for the text
        Shimmer.fromColors(
          baseColor: AppColors.greyColor,
          highlightColor: AppColors.lightGreyColor,
          child: Container(
            height: 15.h,
            width: 50.w, 
            color: AppColors.greyColor,
          ),
        ),
      ],
    );
  }
}
