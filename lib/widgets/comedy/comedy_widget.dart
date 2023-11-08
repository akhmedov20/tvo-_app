import 'package:flutter/material.dart';

import '../../utils/utils.dart';

class ComedyMoviesWidget extends StatelessWidget {
  final String image;
  final String name;
  final double rating;
  const ComedyMoviesWidget({Key? key, required this.image, required this.rating, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w  = Utils.getWidth(context);
    double h  = Utils.getHeight(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8 * w),
      width: 174 * w,
      height: 339 * h,
      child: Column(
        children: [
          SizedBox(
            width: 174 * w,
            height: 249 * h,
            child: Stack(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(image,width: 174 *w,height: 249 * h,fit: BoxFit.cover,)),
                Positioned(
                  top: 10 * h,
                  left: 10 * w,
                  child: Container(
                    width: 40 * w,
                    height: 30 * h,
                    decoration: BoxDecoration(
                        color: Color(0xff2575FC),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Center(
                      child: Text(rating.toStringAsPrecision(2),style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                      ),),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20 * h,),
          SizedBox(
            width: 174 * w,
            child: Text(name,style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 16
            ),),
          ),
        ],
      )
    );
  }
}
