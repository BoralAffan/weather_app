import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:weather_app/src/core/utils/app_colors.dart';

class HoursShimmerWidget extends StatelessWidget {
  const HoursShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      
      height: 180,
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
                    height: 130,
                    width: 80,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Placeholder for the text
                        Container(
                          height: 15,
                          width: 20,
                          color: Colors.grey[300],
                        ),
                        // Placeholder for the image/icon
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        // Placeholder for the temperature text
                        Container(
                          height: 15,
                          width: 30,
                          color: Colors.grey[300],
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
