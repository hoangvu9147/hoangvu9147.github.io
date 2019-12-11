import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:connecthealth/utils/CHColors.dart';
import 'FilterSpecializedDoctorVC.dart';

class CHHomeVC extends StatefulWidget {
  @override
  CHHomeState createState() => new CHHomeState();
}

class CHHomeState extends State<CHHomeVC> {
  double w = 0.0;
  double h = 0.0;
  var arrService = ["Find Doctor","Find Hopital","Get Appointentment"];

  @override
  Widget build(BuildContext context) {
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;

    Widget _buildItems(int index) {
      return InkWell(
          onTap: () {
            print("--- tag -- index $index");
            Navigator.of(context)
                .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
              return new FilterSpecializedDoctorVC(
              );
            }));
          },
          child: Padding(
              padding: EdgeInsets.only(bottom: 2.0),
              child: Card(
                color: Colors.white,
                child: Padding(

                  padding: EdgeInsets.symmetric(
                      vertical: 24.0, horizontal: 26.0),
                    child: Container(
                      height: 40,
                      child: Text(arrService[index], style: TextStyle(
                        fontSize: 18.0,
                        height: 1.6,
                      ),),
                    )

                ),
              )
          )

      );
    }

    return Scaffold(
        appBar: new AppBar(
          title: new Text(
            "Home",
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
                Icons.close,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              }),
        ),
        body: Container(
            width: w,
            height: h,
            color: Colors.white,
            child: new ListView.builder(
                padding: EdgeInsets.only(
                    right: 10.0, left: 15.0, top: 5, bottom: 10),
                scrollDirection: Axis.vertical,
//                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return _buildItems(index);
                })
        )
    );
  }
}
