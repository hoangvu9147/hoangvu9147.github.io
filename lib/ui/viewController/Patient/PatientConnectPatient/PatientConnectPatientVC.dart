import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:connecthealth/utils/CHColors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class PatientConnectPatientVC extends StatefulWidget {

  @override
  PatientConnectPatientState createState() => new PatientConnectPatientState();
}

class PatientConnectPatientState extends State<PatientConnectPatientVC>  {
  double w = 0.0;
  double h = 0.0;


  Widget _buildItems(int index) {
    return InkWell(
      onTap: () {
        print("--- tag -- index $index");
      },
      child: _boxes(
          "https://lh5.googleusercontent.com/p/AF1QipO3VPL9m-b355xWeg4MXmOQTauFAEkavSluTtJU=w225-h160-k-no",
          "Gramercy Tavern"),
    );
  }

  Widget _buildContainer() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
//          margin: EdgeInsets.symmetric(vertical: 20.0),
          height: h,
          child: new ListView.builder(
//              padding:EdgeInsets.only(right: 10.0, left: 10.0, top: 5, bottom: 10),
              scrollDirection: Axis.vertical,
              itemCount: 15,
              itemBuilder: (BuildContext context, int index) {
                return _buildItems(index);
              })),
    );
  }

  Widget _boxes(String _image, String restaurantName) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(5),
        child: new FittedBox(
          child: Material(
            color: Colors.white,
            elevation: 14.0,
            borderRadius: BorderRadius.circular(6.0),
//            shadowColor: Color(0x802196F3),
            child: Container(
              child: ClipRRect(
                borderRadius: new BorderRadius.circular(6.0),
                child: Container(
                  width: w,
                  height: 300,
//                  color: Colors.blueGrey,
                    child: myDetailsContainer(w,300)
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget myDetailsContainer(double widthContent, double heightContent) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 60,
            width: widthContent,
//            color: Colors.blueGrey,
            child: Stack(children: <Widget>[
              Positioned(
                  top: 5,
                  left: 10,
                  child: Container(
                    width: 50,
                    height: 50,
                    child: CircleAvatar(
                      backgroundImage: ExactAssetImage('assets/ic_patient.png'),
                      minRadius: 30,
                      maxRadius: 50,
                    ),
                  )),
              Positioned(
                  top: 0,
                  left: 65,
                  child: Container(
                    width: w-65,
                    height: 60,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize : MainAxisSize.max,
                        crossAxisAlignment :CrossAxisAlignment.start,
                        children: <Widget>[
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
                        "1 giờ trước",
                        textAlign: TextAlign.center,
                        style: new TextStyle(
                          fontWeight: FontWeight.w300,
                          color: Colors.black,
                          fontSize: 13.0,
                        ),
                      ),
                    ]),
                  ))
            ],),
          ),
          Container(
            height: heightContent - (60 + 40),
            width: widthContent,
            color: Colors.blueGrey,
            child: Image.asset('assets/img_hospitall.jpeg',fit: BoxFit.fill,),
//            child: Image(
//               fit: BoxFit.fill,
////              image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQMe8LDUOmBBKwjCQQ8C1fm8sXlnDo2vHwfdzs48bMofFxXb9Wp"),
//            ),

          ),
          Container(
            height: 40,
            width: widthContent,
            child: Row(
              children: <Widget>[
                Container(
                  height: 40,
                  width: widthContent/3,
//                  color: new Color(CHColors.BG_COLOR_DARKTEAL),
                  child:
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.favorite_border,
                        color: Colors.black,
                      ),
                      Container(
                        width: 2,),
                      Text(
                        "yêu thích",
                        textAlign: TextAlign.center,
                        style: new TextStyle(
                          fontWeight: FontWeight.w300,
                          color: Colors.black,
                          fontSize: 17.0,
                        ),
                      ),
                    ],)
                ),
                Container(
                  height: 40,
                  width: widthContent/3,
                  color: Colors.white,
                  child:
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.comment,
                        color: Colors.black,
                      ),
                      Container(
                        width: 2,),
                      Text(
                        "Bình luận",
                        textAlign: TextAlign.center,
                        style: new TextStyle(
                          fontWeight: FontWeight.w300,
                          color: Colors.black,
                          fontSize: 17.0,
                        ),
                      ),
                    ],)
                ),
                Container(
                  height: 40,
                  width: widthContent/3,
//                  color: new Color(CHColors.BG_COLOR_DARKTEAL),
                  child:
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                    Icon(
                      Icons.share,
                      color: Colors.black,
                    ),
                    Container(
                      width: 2,),
                    Text(
                      "Chia sẻ",
                      textAlign: TextAlign.center,
                      style: new TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                        fontSize: 17.0,
                      ),
                    ),
                  ],)
                )
              ],
            ),
          ),

        ]);
  }


  BuildContext context;
  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    w = MediaQuery.of(context).size.width; h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: new AppBar(
        title: new Text(
          "Chia sẻ kinh nghiệm",
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
      body: Stack(
        children: <Widget>[
          _buildContainer(),
        ],
      ),
    );
  }
}
