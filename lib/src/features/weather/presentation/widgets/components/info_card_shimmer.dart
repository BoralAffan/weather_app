import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:weather_app/src/core/utils/app_colors.dart';

class InfoCardShimmerWidget extends StatelessWidget {
  const InfoCardShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return SizedBox(
      height: 240.h,
      width: size.width,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
      
          Shimmer.fromColors(
            baseColor: AppColors.greyColor,
            highlightColor: AppColors.lightGreyColor,
            child: Container(
              height: 180.h,
              margin: const EdgeInsets.only(bottom: 30),
              width: size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey[300],
              ),
            ),
          ),
           
         ],
      ),
    );
  }
}
