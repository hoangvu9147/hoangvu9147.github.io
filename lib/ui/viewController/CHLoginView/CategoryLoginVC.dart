import 'package:flutter/scheduler.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:connecthealth/ui/CHControllerBase.dart';
import 'CHLoginVC.dart';



class CategoryLoginVC extends CHControllerBase {
  static const routeName = '/Category_LoginVC';

  @override
  CategoryLoginState createState() => new CategoryLoginState();
}

class CategoryLoginState extends CHControllerBaseState {
  //Fire authen login



  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  double w = 0.0;
  double h = 0.0;
  var isPushPatient = false;


  @override
  Widget build(BuildContext context) {
    w = MediaQuery.of(context).size.width; h = MediaQuery.of(context).size.height;


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
                      SizedBox(height: h / 3.2),
                      Container(
                        width: w,
                        height: h/2.8,
                        color: Colors.white,
                        child: Column(
                          children: <Widget>[
                            SizedBox(height: 18.0),
                            Text(
                              "Chọn loại đăng nhập",
                              textAlign: TextAlign.center,
                              style: new TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                                fontSize: 25.0,
                              ),
                            ),
                            Container(
                              width: w,
                              height: h/2.8 - 60,
//                              color: Colors.black,
                              child: Row(children: <Widget>[

                                Container(
                                  width: w/2,
                                  height: h/2.8 - 60,
//                                  color: Colors.blue,
                                  child: Column(children: <Widget>[
                                    Container(
                                      width: w / 2,
                                      height: h / 2.8 - 90,
                                      child: Center(
                                        child: GestureDetector(
                                          onTap: () {
                                            print('clicky');
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => CHLoginVC(isPushPatient: true,), fullscreenDialog: true),
                                            );
                                          },
                                          child: ClipOval(
                                            child: Container(
                                              width: h / 2.8 - 100,
                                              height: h / 2.8 - 100,
                                              color: Colors.red,
                                              child: CircleAvatar(
                                                backgroundImage: ExactAssetImage(
                                                    'assets/ic_patient.png'),
                                                minRadius: 30,
                                                maxRadius: 50,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "Bệnh nhân",
                                      textAlign: TextAlign.center,
                                      style: new TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                        fontSize: 25.0,
                                      ),
                                    ),
                                  ],),
//
                                ),
                                Container(
                                  width: w/2,
                                  height: h/2.8 - 60,
//                                  color: Colors.green,
                                  child: Column(children: <Widget>[
                                    Container(
                                      width: w / 2,
                                      height: h / 2.8 - 90,
                                      child: Center(
                                        child: GestureDetector(
                                          onTap: () {
                                            print('clicky');
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => CHLoginVC(isPushPatient: false,), fullscreenDialog: true),
                                            );
                                          },
                                          child: ClipOval(
                                            child: Container(
                                              width: h / 2.8 - 100,
                                              height: h / 2.8 - 100,
                                              color: Colors.red,
                                              child: CircleAvatar(
                                                backgroundImage: ExactAssetImage(
                                                    'assets/ic_doctor.png'),
                                                minRadius: 30,
                                                maxRadius: 50,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "Bác sỹ",
                                      textAlign: TextAlign.center,
                                      style: new TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                        fontSize: 25.0,
                                      ),
                                    ),
                                  ],),

                                )
                              ],),
                            )


                          ],
                        ),
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

