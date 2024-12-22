import 'package:flutter/material.dart';
  class HoursList extends StatelessWidget {
  HoursList({super.key});
   @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(vertical: 10),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => {},
            child: Column(    // for ignoring parent height
              children: [
                // Obx(() =>
                 Card(
                  elevation: 10,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  shadowColor : 
                  // controller.compareIndex(index) ?
                  Colors.blue 
                  // :Colors.
                  ,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  child: Container(
                    height: 130,
                    width: 80,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                        color:   Colors.blue ,
                        borderRadius: BorderRadius.circular(50)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                          Text(
                           '3',
                          style:  TextStyle(
                            color:  Colors.white  ,
                            fontWeight: FontWeight.bold,
                        
                        ),),
                        Placeholder(
                          child: Container(
                             height: 50,
                            width: 50,
                          ),
                        ),
                        Text(
                          
                              '32\u00B0',
                          style:  TextStyle(
                              color: Colors.grey ,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ],
                    
                  )),
                ),
                // )
              ],
            ),
          );
        },
      ),
    );
  }
}
