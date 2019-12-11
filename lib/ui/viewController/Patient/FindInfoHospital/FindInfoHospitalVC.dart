import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:connecthealth/utils/CHColors.dart';
import 'DetailHospitalVC.dart';
import 'package:connecthealth/ui/viewController/Patient/homeView/FindAllDoctorSpecializedVC.dart';
import 'package:connecthealth/ui/viewCustom/CHDialogCenterViewController.dart';

class FindInfoHospitalVC extends StatefulWidget {

  @override
  FindInfoHospitalState createState() => new FindInfoHospitalState();
}

class FindInfoHospitalState extends State<FindInfoHospitalVC>  {
  double w = 0.0;
  double h = 0.0;


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
                return InkWell(
                  onTap: () {
                    print("--- tag -- index $index");
                    Navigator.of(context)
                        .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
                      return new DetailHospitalVC(
                        selectedUrl:"http://quandanymiendong.vn" ,
                      );
                    }));
                  },
                  child: _boxes(),
                );
              })),
    );
  }

  Widget _boxes() {
    return
      Container(
        padding: const EdgeInsets.only(bottom: 10,left: 5,right: 5,top: 5),
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
                    height: 90,
//                    color: Colors.blueGrey,
                    child: myDetailsContainer()
                ),
              ),
            ),
          ),
        ),
      );
  }

  Widget myDetailsContainer() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 90,
            width: 90,
              child: ClipRRect(
                borderRadius: new BorderRadius.circular(6.0),
                     child: Image.asset('assets/img_hospitall.jpeg',fit: BoxFit.fill,),
              )
//                    child: myDetailsContainer("")
          ),
          Container(width: 10,),
          Container(
              height: 90,
              width: w - 100,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                   mainAxisSize : MainAxisSize.max,
                   crossAxisAlignment :CrossAxisAlignment.start,
                  children: <Widget>[
                Text(
                  "Bệnh viện quân dân miền đông",
                  textAlign: TextAlign.start,
                  style: new TextStyle(
                    fontWeight: FontWeight.w800,
                    color: Colors.black,
                    fontSize: 15.0,
                  ),
                ),
                Container(height: 3,),
                Text(
                  "Địa chỉ: 50 Lê Văn Việt, phường Hiệp Phú, Quận 9, TPHCM",
                  textAlign: TextAlign.start,
                  style: new TextStyle(
                    fontWeight: FontWeight.w300,
                    color: Colors.black,
                    fontSize: 13.0,
                  ),
                ),
                Container(height: 3,),
                Text(
                  "SĐT: 028 3730 7125",
                  textAlign: TextAlign.start,
                  style: new TextStyle(
                    fontWeight: FontWeight.w300,
                    color: Colors.black,
                    fontSize: 13.0,
                  ),
                ),
              ])
          )
        ]);
  }


  BuildContext context;
  @override
  void initState() {
    super.initState();

  }

  Widget showdialogCenter() {
      new Future.delayed(Duration.zero, () {
        showDialog(
            context: context, builder: (context) =>
        new CHDialogCenterViewController(
          onOKClick: (){
            Navigator.of(context).pop();
          },
          title:'Thông tin bệnh viện',
          messageContent: 'Thông tin bệnh viện dựa theo vị trí hiện tại của bạn. Bạn có thể tìm kiếm thêm các thông tin khác khi chọn lại vị trí!',
        ));
      });
  }



  @override
  Widget build(BuildContext context) {
    w = MediaQuery.of(context).size.width; h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: new AppBar(
        title: new Text(
          "Danh Sách bệnh viện",
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
          IconButton(
              icon: Icon(Icons.location_on,size: 30,),
              onPressed: () {
                new Future.delayed(Duration.zero, () {
                  showDialog(
                      context: context, builder: (context) =>
                  new CHDialogCenterViewController(
                    onOKClick: (){
                      Navigator.of(context).pop();
                    },
                    title:'Thông tin bệnh viện',
                    messageContent: 'Thông tin bệnh viện dựa theo vị trí hiện tại của bạn. Bạn có thể tìm kiếm thêm các thông tin khác khi chọn lại vị trí!',
                  ));
                });
              }),
        ],
      ),
      body: Stack(
        children: <Widget>[
          _buildContainer(),
        ],
      ),
    );
  }
}
