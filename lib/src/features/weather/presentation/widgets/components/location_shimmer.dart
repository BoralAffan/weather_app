import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:weather_app/src/core/utils/app_colors.dart';

class LocationShimmerWidget extends StatelessWidget {
  const LocationShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container( 
      child: Row(
       
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
             crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Shimmer.fromColors(
                baseColor: AppColors.greyColor,
                highlightColor: AppColors.lightGreyColor,
                child: Container(
                  height: 20.h,
                  width: 100.w,
                  color: AppColors.greyColor,
                ),
              ),
              const SizedBox(height: 10),
              Shimmer.fromColors(
                baseColor: AppColors.greyColor,
                highlightColor: AppColors.lightGreyColor,
                child: Container(
                  height: 15.h,
                  width: 60.w,
                  color: AppColors.greyColor,
                ),
              ),
            ],
          ),
           SizedBox(
            height: 125.h,
            width: 125.w,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical:10.0),
              child: Shimmer.fromColors(
                baseColor: AppColors.greyColor,
                highlightColor: AppColors.lightGreyColor,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    color: AppColors.greyColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
