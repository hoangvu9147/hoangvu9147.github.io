import 'dart:io';import 'package:flutter/material.dart';import 'dart:ui' as ui;import 'package:flutter/rendering.dart';import 'dart:async';import 'package:image_picker_saver/image_picker_saver.dart';
void main() => runApp(MyApp());
class MyApp extends StatelessWidget{@override Widget build(BuildContext context){return MaterialApp(home: _D(),);}}
class _D extends StatefulWidget {@override DState createState() => new DState();}
class DState extends State<_D> with TickerProviderStateMixin {
  var arC=[0xff000000,0xff0000FF,0xff96D9EB,0xff670000,0xffE700FF,0xff009A00,0xffC3C3C3,0xffB4E800,0xffFF7F09,0xff9A009B,0xffFF0000,0xffFFADC9,0xff6E91C0,0xffFFFFFF,0xffFFCD00];
  var arBC=[];var c=0;var iSli=false;var vSl=1.0;var iP=false;var sP=20.0;var iCho=false;var iLC=false;static GlobalKey pre=new GlobalKey();GlobalKey<ScaffoldState> _sKey=new GlobalKey();File _img;
  List<Offset>ps=<Offset>[];Color color=Colors.black;StrokeCap sCap=StrokeCap.round;double _wP=1.0;List<Painter> pList=[];List<String>ls=["save image","remove image"];DragUpdateDetails _d;
  @override
  void initState(){super.initState();setC();}
  void setC(){arBC.clear();for(int i=0;i<15;i++){arBC.add(Colors.transparent);}}
  Future getImage()async{var image=await ImagePickerSaver.pickImage(source:ImageSource.gallery);setState((){_img=image;});}
  void onMenu(String ite)async{setState((){if(ite == ls[0]){take();}else {_img=null;}});}
  take()async{RenderRepaintBoundary bd=pre.currentContext.findRenderObject();var img=await bd.toImage();var byte=await img.toByteData(format:ui.ImageByteFormat.png);var data=byte.buffer.asUint8List();var filePath=await ImagePickerSaver.saveFile(fileData: data);File.fromUri(Uri.file(filePath));_sKey.currentState.showSnackBar(new SnackBar(content: new Text("save image success!")));}
  void setPaint(DragUpdateDetails p){RenderBox o=context.findRenderObject();Offset point=o.globalToLocal(p.globalPosition);point=point.translate(0.0,-(AppBar().preferredSize.height)-25.0);ps=new List.from(ps);ps.add(point);}

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;double h = MediaQuery.of(context).size.height;
    final Slider sl=Slider(min:20.0,max:50.0,value:sP,onChanged:(vl){setState((){sP=vl;vSl=vl-19.0;pList.add(Painter(ps:ps.toList(),c:color,sCap:sCap,w:_wP));ps.clear();sCap = StrokeCap.round;_wP =vl-19.0;});},);
    final Container uiSli=Container(height:30.0,width:w-40,child:Center(child:sl),);

    return Scaffold(key:_sKey,
        appBar: AppBar(
          backgroundColor:new Color(0xff656597),title:Text('Painter'),
          actions:[
            new IconButton(icon:Icon(Icons.brush,color:iLC?Colors.white:iCho? Colors.white:new Color(arC[c]),size: sP,), onPressed:(){setState((){iCho=false;iLC = false; iSli = !iSli;});}),
            new IconButton(icon:Icon(Icons.photo,color: Colors.white) , onPressed:(){getImage();iSli = false;}),
            new IconButton(icon:Icon(Icons.delete,color: Colors.white) , onPressed:(){setState(() {iSli = false;setPaint(_d);ps.clear();pList.clear();});}),
            PopupMenuButton<String>(onSelected:onMenu,itemBuilder:(BuildContext context){return ls.map((String vl){return PopupMenuItem<String>(value:vl,child:Text(vl));}).toList();})
          ],
        ),
        body:
        Stack(children:[Container(child:new Row(children:[RepaintBoundary(key:pre,child:Stack(children:[_img==null?Container():new Image.file(_img,width:w-35.0),Container(width:w-35.0,color:_img==null?Colors.white:Colors.transparent,child:GestureDetector(onPanUpdate:(DragUpdateDetails d){_d=d;setState((){setPaint(d);});},onPanEnd:(DragEndDetails details)=>ps.add(null),child:CustomPaint(painter:Painter(ps:ps,c:color,sCap:sCap,w:_wP,pls:pList),size:Size.infinite,),),),],)),
              Container(width:35.0,color:new Color(0xffD1BFCE),child:new ListView(children:new List.generate(arC.length,(int i){return InkWell(onTap:(){setState((){setC();arBC[i]=Colors.deepOrange;c=i;iLC=true;iSli=false;pList.add(Painter(ps:ps.toList(),c:color,sCap:sCap,w:_wP));ps.clear();sCap=StrokeCap.round;_wP=vSl;color=new Color(arC[i]);});},child:new Center(child:new Container(padding:EdgeInsets.all(4.0),color:arBC[i],height:(h-64)/15.5,child:new Container(color:Colors.white,width:25.0,height:((h-64)/15.5)-18.0,child:new Image.asset("f/$i.png"),),),),);}),),)],),
          ),
          iSli?uiSli:Container(),
        ],),
    );
  }
}

class Painter extends CustomPainter {List<Offset> ps;Color c;StrokeCap sCap;double w;List<Painter> pls;Painter({this.ps, this.c, this.sCap, this.w, this.pls = const []});
  @override void paint(Canvas canvas, Size size) {for (Painter pter in pls) {pter.paint(canvas, size);}Paint paint = new Paint()..color = c..strokeCap = sCap..strokeWidth = w;for (int i = 0; i < ps.length - 1; i++) {if (ps[i] != null && ps[i + 1] != null) {canvas.drawLine(ps[i], ps[i + 1], paint);}}}
  @override bool shouldRepaint(Painter oldDelegate) => oldDelegate.ps != ps;
}
