import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_tags/tag.dart';
import 'package:connecthealth/utils/CHColors.dart';
import 'FindAllDoctorSpecializedVC.dart';

class FilterSpecializedDoctorVC extends StatefulWidget {

  @override
  FilterSpecializedDoctorState createState() => new FilterSpecializedDoctorState();
}

class FilterSpecializedDoctorState extends State<FilterSpecializedDoctorVC>
    with SingleTickerProviderStateMixin {

  double w = 0.0;
  double h = 0.0;




  final List<String> _list = [
    'Bác sỹ  Tim mạch Can thiệp',
    'Bác sỹ  Tim mạch tổng quát',
    'Bác sỹ  Nhịp tim học',
    'Bác sỹ  Hồi sức Tim mạch',
    'Bác sỹ  Phẫu thuật Tim - Lồng ngực mạch máu',
    'Bác sỹ  Nội Tiêu hóa',
    'Bác sỹ  Nội Thần kinh tổng quát',
    'Bác sỹ  Ngoại Thần kinh',
    'Bác sỹ  Nội tiết',
    'Bác sỹ  Bệnh lý mạch máu não',
    'Bác sỹ  Bệnh Nhiệt đới',
    'Bác sỹ  Cơ xương khớp',
    'Bác sỹ  Hô hấp',
    'Bác sỹ  Ngoại Niệu - Ghép thận',
    'Bác sỹ  Nội Thận - Miễn dịch ghép',
    'Bác sỹ  Ngoại tổng quát',
    'Bác sỹ  Ngoại Chấn thương chỉnh hình',
    'Bác sỹ  Tai mũi họng',
    'Bác sỹ  Răng Hàm Mặt - Mắt',
    'Bác sỹ  Y học cổ truyền - Phục hồi chức năng',
    'Bác sỹ  Y học thể thao',
    'Bác sỹ  Nội soi'
  ];

  bool _symmetry = false;
  bool _removeButton = true;
  bool _singleItem = false;
  bool _startDirection = false;
  bool _horizontalScroll = false;
  int _column = 0;
  double _fontSize = 14;

  String _itemCombine = 'withTextBefore';
  List _icon = [Icons.home, Icons.language, Icons.headset];

  @override
  void initState() {
    super.initState();
    _items = _list.toList();
  }

  List _items;

  final GlobalKey<TagsState> _tagStateKey = GlobalKey<TagsState>();

  @override
  Widget build(BuildContext context) {
    w = MediaQuery.of(context).size.width; h = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: new AppBar(
          title: new Text(
            "Bác sỹ chuyên khoa",
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
              }
          ),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.search,size: 30,),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
                    return new FindAllDoctorSpecializedVC(
                    );
                  }));

                }),
          ],
        ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(top: 5,bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _tags1

              ],
            ),
          ),
        ),
      ),
    )

    );
  }

  Widget get _tags1 {
    return Tags(
      key: _tagStateKey,
      symmetry: _symmetry,
      columns: _column,
      horizontalScroll: _horizontalScroll,
      //verticalDirection: VerticalDirection.up, textDirection: TextDirection.rtl,
      heightHorizontalScroll: 60 * (_fontSize / 14),
      itemCount: _items.length,
      itemBuilder: (index) {
        final item = _items[index];

        return ItemTags(
          key: Key(index.toString()),
          index: index,
          title: item,
          pressEnabled: true,
          activeColor: Colors.blueGrey[600],
          singleItem: _singleItem,
          splashColor: Colors.green,
          combine: ItemTagsCombine.withTextBefore,
          image: index > 0 && index < 5
              ? ItemTagsImage(
            //image: AssetImage("img/p$index.jpg"),
              child: Image.network(
                "http://www.clipartpanda.com/clipart_images/user-66327738/download",
                width: 16 * _fontSize / 14,
                height: 16 * _fontSize / 14,
              ))
              : (1 == 1
              ? ItemTagsImage(
            image: NetworkImage(
                "https://d32ogoqmya1dw8.cloudfront.net/images/serc/empty_user_icon_256.v2.png"),
          )
              : null),
          icon: (item == '0' || item == '1' || item == '2')
              ? ItemTagsIcon(
            icon: _icon[int.parse(item)],
          )
              : null,
          removeButton: _removeButton ? ItemTagsRemoveButton() : null,
          textScaleFactor:
          utf8.encode(item.substring(0, 1)).length > 2 ? 0.8 : 1,
          textStyle: TextStyle(
            fontSize: _fontSize,
          ),
          onRemoved: () {
            setState(() {
              _items.removeAt(index);
            });
          },
          onPressed: (item) => print(item),
        );
      },
    );
  }
}
