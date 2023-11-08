import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:outlined_text/outlined_text.dart';

import '../../utils/utils.dart';

class Top10Widget extends StatelessWidget {
  final String image;
  final int num;
  const Top10Widget({Key? key, required this.image, required this.num}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w  = Utils.getWidth(context);
    double h  = Utils.getHeight(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8 *w),
      width: 324 * w,
      height: 339 * h,
      child: Stack(
        children: [
          OutlinedText(
            text: Text(num.toString(),style: GoogleFonts.archivo(
                textStyle: TextStyle(
                    color: Colors.black,
                    fontSize:205
                )
            ),
            ),
            strokes: [
              OutlinedTextStroke(
                  color: Colors.blue,
                  width: 4 * w
              ),
            ],
          ),
          Positioned(
            left: 80 * w,
            top: 40 * h,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(image,width: 174 *w,height: 249 * h,fit: BoxFit.cover,)),
          ),
        ],
      )
    );
  }
}
