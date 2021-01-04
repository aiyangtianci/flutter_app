
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PickerDemo extends StatefulWidget {
  @override
  State createState() => PickerState();
}

class PickerState extends State<PickerDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: CupertinoPicker(
          //比例
          diameterRatio: 1,
          //放大效果，默认false。
          useMagnifier: true,
          // 放大倍数，需先开启放大效果，此参数才有作用。
          magnification: 1,
          //子项高度，选中位置的高度。
          itemExtent: 45,
          //压缩(间距）
          squeeze :1.0,
          backgroundColor: Colors.blueGrey[100],
          onSelectedItemChanged: (index) {},
          children: <Widget>[
            Container(
              color: Colors.primaries[1],
              child: Text("1112"),
            ),
            Container(color: Colors.primaries[2], child: Text("1112")),
            Container(color: Colors.primaries[3], child: Text("1112")),
            Container(color: Colors.primaries[4], child: Text("1112")),
            Container(color: Colors.primaries[5], child: Text("1112")),
            Container(color: Colors.primaries[6], child: Text("1112")),
          ],
        ),
      ),
    );
  }
}