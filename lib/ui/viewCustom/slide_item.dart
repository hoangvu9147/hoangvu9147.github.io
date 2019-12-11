import 'package:flutter/material.dart';

import 'package:connecthealth/Model/Slide.dart';

class SlideItem extends StatelessWidget {
  final int index;
  SlideItem(this.index);
  double w = 0.0;
  double h = 0.0;


  @override
  Widget build(BuildContext context) {
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
//        Container(
//          height: h - ((h/5) * 3),
//          width: w,
//        )
        Container(
          height: h - ((h/5) * 2),
          width: w,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            image: DecorationImage(
              image: AssetImage(slideList[index].imageUrl),
              fit: BoxFit.fill,
            ),
          ),
        ),
//        SizedBox(
//          height: 40,
//        ),
//        Text(
//          slideList[index].title,
//          style: TextStyle(
//            fontSize: 22,
//            color: Theme.of(context).primaryColor,
//          ),
//        ),
//        SizedBox(
//          height: 10,
//        ),
//        Text(
//          slideList[index].description,
//          textAlign: TextAlign.center,
//        ),
      ],
    );
  }
}