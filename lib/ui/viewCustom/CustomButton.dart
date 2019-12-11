import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


//class CustomButton extends StatefulWidget {
//
//  CustomButton(
//      {this.titleBtn,
//        @required this.onPressed
//      });
//
//  final String titleBtn;
//  final GestureTapCallback onPressed;
//
//  @override
//  CustomButtonState createState() => CustomButtonState();
//}

class CustomButton extends StatelessWidget {
  CustomButton({@required this.onPressed,this.titleBtn,this.hexBG});
  final GestureTapCallback onPressed;
  final String titleBtn;
  final int hexBG;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      fillColor: new Color(hexBG),
      splashColor: Colors.greenAccent,
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
//            Icon(
//              Icons.face,
//              color: Colors.amber,
//            ),
            SizedBox(
              width: 10.0,
            ),
            Text(titleBtn,
              maxLines: 1,
              style: new TextStyle(
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                  fontSize: 18.0),
            ),
          ],
        ),
      ),
      onPressed: onPressed,
      shape: const StadiumBorder(),
    );
  }
}