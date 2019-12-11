import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:connecthealth/utils/CHColors.dart';
import 'package:connecthealth/ui/viewController/Patient/CHMainGirdVC.dart';

import 'package:connecthealth/ui/viewController/Doctors/CHMainDoctorsVC.dart';


class CHLoginVC extends StatefulWidget {
  static const routeName = '/loginVC';
  CHLoginVC({Key key, this.title, this.isPushPatient}) : super(key: key);
  final String title;
  final bool isPushPatient;

  @override
  CHLoginVCState createState() => CHLoginVCState();
}

class CHLoginVCState extends State<CHLoginVC> {
  //Fire authen login

  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  double w = 0.0;
  double h = 0.0;

  @override
  Widget build(BuildContext context) {
    w = MediaQuery.of(context).size.width; h = MediaQuery.of(context).size.height;

//
    final numberField = TextField(
      obscureText: true,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "+84 123456789",
          border:OutlineInputBorder(borderRadius: BorderRadius.circular(6.0)),
      ),
    );

    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(6.0),
      color: Color(CHColors.BG_COLOR_DARKTEAL),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          print("click Login");
          if (widget.isPushPatient == true){
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CHMainGirdVC(), fullscreenDialog: true),
            );
          }else {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CHMainDoctorsVC(), fullscreenDialog: true),
            );
          }

        },
        child: Text("Đăng nhập",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );


    return Scaffold(
      body:  Container(
        width: w,
        height: h,
        child: Stack(
          alignment: AlignmentDirectional.topStart,
          children: <Widget>[

            Positioned(
                left: 0.0,
                top: 0.0,
                child: Container(
                  width: w,
                  height: h,
                  color: Colors.black,
                  child: Image.asset(
                    "assets/bg_Doctor.png",
                      fit: BoxFit.cover
                  ),

                )),
            Positioned(
                left: 0.0,
                top: 0.0,
                child: Container(
                  width: w,
                  height: h,
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: h / 2.8),
                      Container(
                        width: w,
                        height: h/3,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Nhập số điện thoại của bạn!",
                                maxLines: 1,
                                textAlign: TextAlign.start,
                                style: new TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.0,
                                ),
                              ),
                              SizedBox(height: 15.0),
                              numberField,
                              SizedBox(
                                height: 15.0,
                              ),
                              loginButon,


                            ],
                          ),
                        )

                      )

                    ],
                  ),
                )
            )
          ],
        ),
      ),
    );
  }
}