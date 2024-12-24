import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:weather_app/src/core/utils/app_colors.dart';

class HoursShimmerWidget extends StatelessWidget {
  const HoursShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      
      height: 180.h,
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(vertical: 10),
        itemBuilder: (context, index) {
          return Column(
            children: [
              Shimmer.fromColors(
                baseColor: AppColors.greyColor,
                highlightColor: AppColors.lightGreyColor,
                child: Card(
                  elevation: 0,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Container(
                    height: 120.h,
                    width: 70.w,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: AppColors.greyColor,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                         Container(
                          height: 15,
                          width: 20,
                          color: AppColors.greyColor,
                        ),
                         Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: AppColors.greyColor,
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                         Container(
                          height: 15,
                          width: 30,
                          color: AppColors.greyColor,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
