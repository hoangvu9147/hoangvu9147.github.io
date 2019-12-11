import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:connecthealth/utils/CHColors.dart';

class CHhistoryVC extends StatefulWidget {

  @override
  CHhistoryState createState() => new CHhistoryState();
}

class CHhistoryState extends State<CHhistoryVC>  {

  double w = 0.0;
  double h = 0.0;


  @override
  Widget build(BuildContext context) {
    w = MediaQuery.of(context).size.width; h = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: new AppBar(
          title: new Text(
            "Lịch sử khám bệnh",
            textAlign: TextAlign.center,
            style: new TextStyle(
              fontWeight: FontWeight.w400,
              color: Colors.white,
              fontSize: 25.0,
            ),
          ),
          backgroundColor: new Color(CHColors.BG_COLOR_DARKTEAL),
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              }),

        ),
        body: Container(
          width: w,
          height: h,
          color: Colors.white,
          child: Center(child:
          Text(
            "Hiển thị các thông tin quản lý lịch sử khám bệnh",
            textAlign: TextAlign.center,
            style: new TextStyle(
              fontWeight: FontWeight.w300,
              color: Colors.black,
              fontSize: 18.0,
            ),
          ),),
        )
    );
  }
}
