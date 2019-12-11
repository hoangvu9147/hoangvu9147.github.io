import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:connecthealth/utils/CHColors.dart';


class CHMainDoctorsVC extends StatefulWidget {

  @override
  CHMainDoctorsState createState() => new CHMainDoctorsState();
}

class CHMainDoctorsState extends State<CHMainDoctorsVC>  {
  double w = 0.0;
  double h = 0.0;


  @override
  Widget build(BuildContext context) {
    w = MediaQuery.of(context).size.width; h = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: new AppBar(
          title: new Text(
            "Kế hoạch",
            textAlign: TextAlign.center,
            style: new TextStyle(
              fontWeight: FontWeight.w400,
              color: Colors.white,
              fontSize: 25.0,
            ),
          ),
          backgroundColor: new Color(CHColors.BG_COLOR_DARKTEAL),

        ),
        body: Container(
          width: w,
          height: h,
          color: Colors.white,
          child: Center(child:
          Text(
            "Hiển thị các thông báo lịch hẹn bác sỹ với bệnh nhân, lên kế hoạch xử lý từng bệnh nhân liên quan",
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
