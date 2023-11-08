import 'package:flutter/material.dart';

import '../../utils/utils.dart';

class PosterWidget extends StatelessWidget {
  final String image;
  final String description;
  const PosterWidget({Key? key, required this.image, required this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w  = Utils.getWidth(context);
    double h  = Utils.getHeight(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5 * w),
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(image,width: MediaQuery.of(context).size.width,fit: BoxFit.cover,),
          SizedBox(height: 20 *h,),
          Text(description,style: TextStyle(
            fontSize: 20,
            color: Colors.white
          ),),
          SizedBox(height: 10 * h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: (){},
                child: Container(
                  margin: EdgeInsets.only(left: 10 * w, right: 10 * w),
                  width: 120 * w,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Color(0xFF2575FC),
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child: Center(
                    child: Text("Смотреть",style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold
                    ),),
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){},
                child: Container(
                  margin: EdgeInsets.only(left: 10 * w, right: 10 * w),
                  width: 120 * w,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.25),
                      borderRadius: BorderRadius.circular(15)
                  ),
                  child: Center(
                    child: Text("О фильме",style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold
                    ),),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
