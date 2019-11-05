import 'package:flutter/material.dart';
import 'dart:async';

class FlashPage extends StatefulWidget {
  @override
  loadingState createState() {
    return new loadingState();
  }
}

class loadingState extends State<FlashPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    new Future.delayed(
      Duration(seconds: 3),
      () {
        print('即时通讯App实现。。。1');
        Navigator.of(context).pushReplacementNamed('app');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: Stack(
        children: <Widget>[
          Image.asset('images/welcome.jpeg',
              fit: BoxFit.fill,
              width: double.infinity, //无穷；无限大；无限距
              height: double.infinity),
          new Positioned(
            //定位：偏移指定像素值
            bottom: 25.0,
            right: 25.0,
            child: _NextGoButton(context),
          )
        ],
      ),
    );
  }
}

Widget _NextGoButton(BuildContext context) {
  return new GestureDetector(
    onTap: () {
      Navigator.of(context).pushReplacementNamed('app');
    },
    child: new Container(
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: Colors.lightBlue[50],
        borderRadius: new BorderRadius.circular(25.0),
      ),
      child: new Text(
        '跳过',
        style: TextStyle(
            color: Colors.orange,
            fontSize: 15.0,
            decoration: TextDecoration.none,
            fontStyle: FontStyle.normal,
            letterSpacing: 5.0),
      ),
    ),
  );
}
