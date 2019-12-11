import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:connecthealth/utils/CHColors.dart';
import 'FormContactsPatientDoctors.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class FindAllDoctorSpecializedVC extends StatefulWidget {
  @override
  FindAllDoctorSpecializedState createState() =>
      new FindAllDoctorSpecializedState();
}

class FindAllDoctorSpecializedState extends State<FindAllDoctorSpecializedVC> {
  double w = 0.0;
  double h = 0.0;
  var isShowDialogContacts = false;
  Completer<GoogleMapController> _controller = Completer();


  Widget _buildItems(int index) {
    return InkWell(
      onTap: () {
        print("--- tag -- index $index");
      },
      child: _boxes(
          "https://lh5.googleusercontent.com/p/AF1QipO3VPL9m-b355xWeg4MXmOQTauFAEkavSluTtJU=w225-h160-k-no",
          40.738380,
          -73.988426,
          "Gramercy Tavern"),
    );
  }

  Widget _buildContainer() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
          margin: EdgeInsets.symmetric(vertical: 20.0),
          height: 220.0,
          child: new ListView.builder(
              padding:
                  EdgeInsets.only(right: 10.0, left: 10.0, top: 5, bottom: 10),
              scrollDirection: Axis.horizontal,
//                shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return _buildItems(index);
              })),
    );
  }

  Widget _boxes(String _image, double lat, double long, String restaurantName) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.only(right: 17),
        child: new FittedBox(
          child: Material(
            color: Colors.white,
            elevation: 14.0,
            borderRadius: BorderRadius.circular(10.0),
            shadowColor: Color(0x802196F3),
            child: Container(
              child: ClipRRect(
                borderRadius: new BorderRadius.circular(10.0),
                child: Container(
                    width: 150,
                    height: 220,
                    color: Colors.white,
                    child: myDetailsContainer("")),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget myDetailsContainer(String restaurantName) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 32,
            width: 150,
//                              color: Colors.blue,
            child: Row(
              children: <Widget>[
                Container(
                  width: 10,
                ),
                Container(
                  height: 20,
                  width: 20,
//                                  color: new Color(CHColors.BG_COLOR_DARKTEAL),
                  child: ClipOval(
                    child: Container(
//                                      width: 20,
//                                      height: 20,
                      color: Colors.red,
                    ),
                  ),
                ),
                Container(
                  width: 60,
                ),
                Icon(
                  Icons.star_border,
                  size: 20,
                  color: new Color(CHColors.BG_COLOR_DARKTEAL),
                ),
                Text(
                  " 4.5",
                  textAlign: TextAlign.center,
                  style: new TextStyle(
                    fontWeight: FontWeight.w300,
                    color: Colors.black,
                    fontSize: 13.0,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 90,
            width: 90,
//                              color: Colors.blue,
            child: CircleAvatar(
              backgroundImage: ExactAssetImage('assets/ic_patient.png'),
              minRadius: 30,
              maxRadius: 50,
            ),
          ),
          Container(
            height: 8,
          ),
          Container(
              height: 50,
              width: 150,
//                              color: Colors.pink,
              child: Column(children: <Widget>[
//                                  SizedBox(width: 30.0),
                Text(
                  "Nguyễn Văn A",
                  textAlign: TextAlign.center,
                  style: new TextStyle(
                    fontWeight: FontWeight.w800,
                    color: Colors.black,
                    fontSize: 15.0,
                  ),
                ),
                Text(
                  "Bác sỹ khoa nội",
                  textAlign: TextAlign.center,
                  style: new TextStyle(
                    fontWeight: FontWeight.w300,
                    color: Colors.black,
                    fontSize: 13.0,
                  ),
                ),
              ])
          ),
          Container(
            height: 40,
            width: 150,
//                              color: Colors.blue,
            child: Row(
              children: <Widget>[
                Container(
                  height: 40,
                  width: 75,
                  color: new Color(CHColors.BG_COLOR_DARKTEAL),
                  child: IconButton(
                      icon: Icon(
                        Icons.call,
                        color: Colors.white,
                      ),
                      onPressed: null),
                ),
                Container(
                  height: 40,
                  width: 75,
                  color: Colors.white,
                  child: IconButton(
                      icon: Icon(
                        Icons.message,
                        color: new Color(CHColors.BG_COLOR_DARKTEAL),
                      ),
                      onPressed: (){
                        pushViewContactsScheduleDoctor();
                      }),
                )
              ],
            ),
          ),
        ]);
  }

  //Dialog Contacts Doctor
  Widget dialogContacts() {
    return Container(
      width: w,
      height: h,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 40,
            left: 20,
            right: 20,
            bottom: 40,
            child: Container(
              child: new FittedBox(
                child: Material(
                  color: Colors.white,
                  elevation: 14.0,
                  borderRadius: BorderRadius.circular(10.0),
                  shadowColor: Color(0x802196F3),
                  child: Container(
                    child: ClipRRect(
                      borderRadius: new BorderRadius.circular(10.0),
                      child: Container(
                        width: w - 20,
                        height: h - 80,
                        color: Colors.white,
                        child: myDetailsContacts(w - 20, h - 80),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          //Avatar
          Positioned(
              top: 10,
              left: (w - 70) / 2,
              child: Container(
                width: 70,
                height: 70,
//              color: Colors.black,
                child: CircleAvatar(
                  backgroundImage: ExactAssetImage('assets/ic_patient.png'),
                  minRadius: 30,
                  maxRadius: 50,
                ),
              )),
        ],
      ),
    );
  }

  Widget myDetailsContacts(double widthContent, double heightContent) {
    return Column(
//        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 32,
            width: widthContent,
            child: Row(
              children: <Widget>[
                Container(
                  width: 10,
                ),
                Container(
                  height: 20,
                  width: 20,
                  child: ClipOval(
                    child: Container(
                      color: Colors.green,
                    ),
                  ),
                ),
                Container(
                  width: widthContent - 90,
                ),
                Icon(
                  Icons.star_border,
                  size: 20,
                  color: new Color(CHColors.BG_COLOR_DARKTEAL),
                ),
                Text(
                  " 4.5",
                  textAlign: TextAlign.center,
                  style: new TextStyle(
                    fontWeight: FontWeight.w300,
                    color: Colors.black,
                    fontSize: 13.0,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: heightContent / 2.5,
            width: widthContent,
            color: Colors.blueGrey,
            child: _buildGoogleMap(context),
//            child: Center(child:
//            Text(
//              "Hiển thị Google Map",
//              textAlign: TextAlign.center,
//              style: new TextStyle(
//                fontWeight: FontWeight.w800,
//                color: Colors.black,
//                fontSize: 15.0,
//              ),
//            ),),
          ),
          Container(
            height: heightContent - (heightContent / 2.5 + 40 + 32),
            width: widthContent,
            color: Colors.white,
            child: Center(child:
            Text(
              "Hiển thị kết quả tính toán (cự ly đi lại, số điểm tích luỹ, kinh nghiêm , và thông tin chi tiết bác sy)",
              textAlign: TextAlign.center,
              style: new TextStyle(
                fontWeight: FontWeight.w300,
                color: Colors.black,
                fontSize: 15.0,
              ),
            ),),
          ),
          Container(
            height: 40,
            width: widthContent,
//                              color: Colors.blue,
            child: Row(
              children: <Widget>[
                Container(
                  height: 40,
                  width: widthContent/2,
                  color: new Color(CHColors.BG_COLOR_DARKTEAL),
                  child: IconButton(
                      icon: Icon(
                        Icons.call,
                        color: Colors.white,
                      ),
                      onPressed: null),
                ),
                Container(
                  height: 40,
                  width: widthContent/2,
                  color: Colors.white,
                  child: IconButton(
                      icon: Icon(
                        Icons.message,
                        color: new Color(CHColors.BG_COLOR_DARKTEAL),
                      ),
                      onPressed: (){
                        pushViewContactsScheduleDoctor();
                      }),
                )
              ],
            ),
          ),
        ]);
  }

  //Maps
  Widget _buildGoogleMap(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child:
        GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition:  CameraPosition(target: LatLng(40.712776, -74.005974), zoom: 12),
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
          markers: {blueMarker
        },
        ),
    );
  }

  Marker blueMarker = Marker(
    markerId: MarkerId('locaition_1'),
    position: LatLng(40.732128, -73.999619),
    infoWindow: InfoWindow(title: 'Vu test'),
    icon:
    BitmapDescriptor.defaultMarkerWithHue(
      BitmapDescriptor.hueGreen,
    ),
  );


  void pushViewContactsScheduleDoctor(){
    setState(() {
      isShowDialogContacts = false;
    });
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => FormContactsPatientDoctorsVC(), fullscreenDialog: true),
    );
  }

  @override
  void initState() {
    super.initState();
    var _duration = new Duration(seconds: 5);

    new Timer(_duration, () {
      setState(() {
        isShowDialogContacts = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: new AppBar(
        title: new Text(
          "Tìm Bác Sỹ",
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
        actions: <Widget>[
          isShowDialogContacts ? IconButton(
              icon: Icon(Icons.close,size: 30,),
              onPressed: () {
                  if (isShowDialogContacts == true){
                    setState(() {
                      isShowDialogContacts = false;
                    });
                  }
              }) : Container(),
        ],
      ),
      body: Stack(
        children: <Widget>[
          Container(
            height: h,
            width: w,
            color: Colors.brown[300],
            child: _buildGoogleMap(context),
//            Center(child:
//            Text(
//              "Hiển thị Google Map",
//              textAlign: TextAlign.center,
//              style: new TextStyle(
//                fontWeight: FontWeight.w800,
//                color: Colors.black,
//                fontSize: 15.0,
//              ),
//            ),),
          ),
          _buildContainer(),
          isShowDialogContacts ? dialogContacts() : Container()
        ],
      ),
    );
  }
}
