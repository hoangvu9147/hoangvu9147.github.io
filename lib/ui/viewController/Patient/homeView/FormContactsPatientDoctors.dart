import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:connecthealth/utils/CHColors.dart';


class FormContactsPatientDoctorsVC extends StatefulWidget {

  @override
  FormContactsPatientDoctorsState createState() => new FormContactsPatientDoctorsState();
}

class FormContactsPatientDoctorsState extends State<FormContactsPatientDoctorsVC>  {
  double w = 0.0;
  double h = 0.0;

  @override
  Widget build(BuildContext context) {
    w = MediaQuery.of(context).size.width; h = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: new AppBar(
          title: new Text(
            "Đặt lịch khám bệnh",
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
        )
    );
  }
}
