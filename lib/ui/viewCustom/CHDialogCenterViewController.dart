import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';


class CHDialogCenterViewController extends StatefulWidget {
  CHDialogCenterViewController(
      {this.title,
        this.messageContent,
        @required this.onOKClick
      });

  final String title;
  final String messageContent;
  final VoidCallback onOKClick;

  @override
  State<StatefulWidget> createState() => new CHDialogCenterViewState();
}

class CHDialogCenterViewState extends State<CHDialogCenterViewController> {


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    // TODO: implement build

    return Platform.isIOS
        ? _createCupertinoAlertDialog()
        : _createMaterialAlertDialog();
  }

  AlertDialog _createMaterialAlertDialog() => new AlertDialog(
    title: new Text(widget.title),
    content: new Text(widget.messageContent),
    actions: <Widget>[

      new MaterialButton(
          onPressed: () {
            Navigator.pop(context);
            widget.onOKClick();
          },
          child: new Text('OK')),
    ],
  );


  CupertinoAlertDialog _createCupertinoAlertDialog() => new CupertinoAlertDialog(
    title: new Text(widget.title),
    content: new Text(widget.messageContent),
    actions: <Widget>[

      new CupertinoButton(
          onPressed: () {
            Navigator.pop(context);
            widget.onOKClick();
          },
          child: new Text('OK')),
    ],
  );
}