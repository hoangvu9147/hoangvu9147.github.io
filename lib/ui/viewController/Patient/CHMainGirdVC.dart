import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:connecthealth/Model/Slide.dart';
import 'package:connecthealth/utils/CHColors.dart';


import 'package:connecthealth/ui/viewCustom/slide_dots.dart';
import 'package:connecthealth/ui/viewCustom/slide_item.dart';
import 'package:connecthealth/ui/viewCustom/CustomButton.dart';
import 'package:connecthealth/ui/viewController/Patient/homeView/FilterSpecializedDoctorVC.dart';
import 'package:connecthealth/ui/viewController/Patient/FindInfoHospital/FindInfoHospitalVC.dart';
import 'package:connecthealth/ui/viewController/Patient/PatientConnectPatient/PatientConnectPatientVC.dart';
import 'package:connecthealth/ui/viewController/Patient/historyView/CHhistoryVC.dart';
import 'package:connecthealth/ui/viewController/Patient/TrackHealthPatient/TrackHealthPatientVC.dart';
import 'package:connecthealth/ui/viewController/Patient/settingView/CHSettingVC.dart';



class CHMainGirdVC extends StatefulWidget {
  @override
  CHMainGirdState createState() => new CHMainGirdState();
}

class CHMainGirdState extends State<CHMainGirdVC> {
  double w = 0.0;
  double h = 0.0;
  double aspectRatio = 0.0;
  ScrollController controller;
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  var arrNameEvent = ["Tìm bác sỹ","thông tin bệnh viện","Kết nối bệnh nhân",
                      "Theo dõi sức khoẻ","Lịch sử khám bệnh","Cài đặt"];
  var arrIcon = [Icons.find_replace,Icons.info,Icons.contact_mail,
                Icons.favorite,Icons.history,Icons.settings];

  Widget _boxes(String _image,String event,int index) {
    return  RaisedButton(
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(8.0),
            side: BorderSide(color: Colors.white)),
        onPressed: () {
          if (index == 0) {
            pushViewFindDoctor();
          }else if (index == 1) {
            pushViewFindInfoHospital();
          }else if (index == 2){
            pushViewPatientConectPatient();
          }else if (index == 3) {
            pushViewTrackPatientHealth();
          }else if (index == 4){
            pushViewSchedulePatientHistory();
          }else {
            pushViewSetting();
          }
        },
        color: Colors.white,
        textColor: Colors.white,
        child: Container(
          width: w/2,
//          color: Colors.yellow,
          child: Column(children: <Widget>[
//          Container(
//          height: 10),
            Container(
                height: (h/5)/2,
                child: Center(child:
                Icon(
                  arrIcon[index],
                  size: 30,color: Colors.black,),),
            ),
              Center(
                child:
                Text(event,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black
                    )),
              ),
//            )
          ],),
        )

    );
  }


  Widget _buildSuggestions() {
    return new GridView.builder(
        padding: const EdgeInsets.only(left: 2),
        controller: controller,
        itemCount: 6,
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: aspectRatio,
          mainAxisSpacing: 1.0,
          crossAxisSpacing: 1.0,
        ),
        itemBuilder: (context, index) {
          return new Container(
//              height: 280.0,
            padding: const EdgeInsets.all(5.0),
//            color: Colors.green,
            child: new InkWell(
              onTap: () {},
              child: new Container(
//                padding: const EdgeInsets.all(15.0),
//                color: Colors.blue,
                child: _boxes("", arrNameEvent[index],index),
              ),
            ),
          );
        });
  }

  void _scrollListener() {
    if (controller.position.pixels == controller.position.maxScrollExtent) {}
  }

  @override
  void initState() {
    super.initState();
    print("-OSBookSearchContentGirdViewState---- initState");

    controller = new ScrollController()..addListener(_scrollListener);
    Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  void pushViewFindDoctor(){
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => FilterSpecializedDoctorVC(), fullscreenDialog: true),
    );
  }

  void pushViewFindInfoHospital(){
    Navigator.of(context)
        .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
      return new FindInfoHospitalVC(
      );
    }));
  }

  void pushViewPatientConectPatient(){
    Navigator.of(context)
        .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
      return new PatientConnectPatientVC(
      );
    }));
  }
  void pushViewSchedulePatientHistory(){
    Navigator.of(context)
        .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
      return new CHhistoryVC(
      );
    }));
  }
  void pushViewTrackPatientHealth(){
    Navigator.of(context)
        .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
      return new TrackHealthPatientVC(
      );
    }));
  }
  void pushViewSetting(){
    Navigator.of(context)
        .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
      return new CHSettingVC(
      );
    }));
  }




  @override
  Widget build(BuildContext context) {
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;
    aspectRatio = (w/3)/(h/5);

    return Scaffold(
        body: Container(
          width: w,
          height: h,
          child: Column(children: <Widget>[
            // slide menu page
            Container(
              width: w,
              height: h - ((h/5) * 2),
//              color: Colors.pink,
              child: Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children : <Widget>[
                PageView.builder(
                scrollDirection:Axis.horizontal,
                controller: _pageController,
                onPageChanged: _onPageChanged,
                itemCount: slideList.length,
                itemBuilder: (ctx, i) => SlideItem(i),
              ),
              Stack(alignment: AlignmentDirectional.topStart,children: <Widget>[
              Container(
              margin: const EdgeInsets.only(bottom: 35),
              child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                 for (int i = 0; i < slideList.length; i++)
                    if (i == _currentPage)
                       SlideDots(true)
                    else
                       SlideDots(false)],
                  ),
                    )],
                      )],
                    ),
            ),
            Container(
              width: w,
              height: h - (h - ((h/5) * 2)),
              child:_buildSuggestions(),
            )
          ],),
        ));
  }
}
