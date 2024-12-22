import 'package:flutter/material.dart';
import 'package:weather_app/src/core/utils/image_paths.dart';
 
class InfoCard extends StatelessWidget {
   InfoCard({super.key});
   @override
  Widget build(BuildContext context) {
    var size=MediaQuery.sizeOf(context);
    return SizedBox(
      height: 240,
      width: size.width,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: 180,
            margin: const EdgeInsets.only(bottom: 30),
            width: size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.blue.withOpacity(.7),
                      Colors.blue,
                      Colors.blue,
                    ])),
          ),
          Positioned(
              top: -10,
              left: 10,
              child: Placeholder(
                child: Container( height: 150,
                width: 170,),
              // child: Image.asset(
                // controller.getImage(controller.currentIndex.value),
               
                 
              )),
          Positioned(
            bottom: 50,
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'no condition',
                  style: const TextStyle(
                      height: 0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 23),
                ),
                const SizedBox(height: 5,),
                Text(
                  '6am',
                  style: TextStyle(
                      height: 0,
                      color: Colors.white.withOpacity(.8),
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ],
            ),
          ),
          Positioned(
            top: 40,
            right: 50,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.white,
                        Colors.white.withOpacity(.1)
                      ],
                      // Adjust the stops to control the gradient area
                    ).createShader(bounds);
                  },
                  child:  Text(
                    '43',
                    style: const TextStyle(
                      fontSize: 60,
                      height: 0,
                      fontWeight: FontWeight.bold,
                      color:
                      Colors.white, // Initial color of the text
                    ),
                  ),

                ),
                Text(
                  'Feel like 23',
                  style: const TextStyle(
                      height: 0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),

              ],
            ),
          ),
          Positioned(
            bottom: 20,
              right: 0,
              child : ShaderMask(
                shaderCallback: (Rect bounds) {
                  return LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.white,
                      Colors.white.withOpacity(.1)
                    ],
                    // Adjust the stops to control the gradient area
                  ).createShader(bounds);
                },
                child: Image.asset(ImagePaths.windWave,height: 100,width: 200,),
              ),



              )
        ],
      ),
    );
  }
}
