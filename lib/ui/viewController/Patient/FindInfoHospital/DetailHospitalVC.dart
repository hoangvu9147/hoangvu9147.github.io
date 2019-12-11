import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:connecthealth/utils/CHColors.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DetailHospitalVC extends StatefulWidget {
  final String title;
  final String selectedUrl;
  DetailHospitalVC({
    this.title,
    this.selectedUrl
  });

  @override
  DetailHospitalState createState() => new DetailHospitalState();
}

class DetailHospitalState extends State<DetailHospitalVC>  {
  double w = 0.0;
  double h = 0.0;

  final Completer<WebViewController> _controller =
  Completer<WebViewController>();


  @override
  Widget build(BuildContext context) {
    w = MediaQuery.of(context).size.width; h = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: new AppBar(
          title: new Text(
            "Thông Tin bệnh viện",
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
//        body: Container(
//          width: w,
//          height: h,
//          color: Colors.red,
//        )
      body: WebView(
      initialUrl: widget.selectedUrl,
      javascriptMode: JavascriptMode.unrestricted,
      onWebViewCreated: (WebViewController webViewController) {
        _controller.complete(webViewController);
      },
    ),
    );
  }
}
