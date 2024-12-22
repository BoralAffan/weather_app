import 'package:flutter/material.dart';
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
                  height: 20,
                  width: 100,
                  color: Colors.grey[300],
                ),
              ),
              const SizedBox(height: 10),
              Shimmer.fromColors(
                baseColor: AppColors.greyColor,
                highlightColor: AppColors.lightGreyColor,
                child: Container(
                  height: 15,
                  width: 60,
                  color: Colors.grey[300],
                ),
              ),
            ],
          ),
           SizedBox(
            height: 150,
            width: 150,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical:10.0),
              child: Shimmer.fromColors(
                baseColor: AppColors.greyColor,
                highlightColor: AppColors.lightGreyColor,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    color: Colors.grey[300],
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
