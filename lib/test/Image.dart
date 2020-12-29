import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    title: "Container demo",
//    home: new LayoutDemo(),
  home: new StackDemo(),
//    home: new ImageDemo(),
  ));
}

/**
 * 包装控件
 */
class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget packgeRow = new Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        new Icon(Icons.star, color: Colors.green),
        new Icon(Icons.star, color: Colors.green),
        new Icon(Icons.star, color: Colors.green),
        new Icon(Icons.star, color: Colors.green),
        new Icon(Icons.star, color: Colors.grey),
        new Icon(Icons.star, color: Colors.white),
      ],
    );

    return new Scaffold(
      appBar: AppBar(
        title: Text('包裹控件'),
      ),
      body: packgeRow,
    );
  }
}

/**
 * stack 层叠布局
 */
class StackDemo extends StatelessWidget {
  var stack = new Stack(
    alignment: const FractionalOffset(0.5, 0.5), //偏移量
    children: <Widget>[
      new CircleAvatar(
        backgroundImage: new AssetImage('images/icon_addresslist.png'),
        radius: 100.0,
      ),
      new Positioned(
        //定位：偏移指定像素值
        bottom: 50.0,
        right: 50.0,
        child: Text('昵称',
            style: new TextStyle(
                color: Colors.red,
                fontSize: 22.0,
                fontWeight: FontWeight.bold)),
      )
    ],
  );

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('层叠布局'),
      ),
      body: new Center(
        child: stack,
      ),
    );
  }
}

/**
 * Container边框修饰+Image
 */
class ImageDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      new Scaffold(
        appBar: AppBar(
          title: Text('图片裁剪'),
        ),
        body:  Center(
          child: new Container(
            width: 200,
            height: 200,
            decoration: new BoxDecoration(
              color: Colors.lightBlueAccent,
              //背景色
//            gradient: LinearGradient(//线性渐变色
//                begin: FractionalOffset(0.5, 0.0),//偏移量
//                end: FractionalOffset(1.0, 1.0),
//                colors: <Color>[Colors.red,Colors.green,Colors.blue,Colors.grey]),
              gradient: RadialGradient(
                center: Alignment(-0.0, -0.0), //中心抽偏移量
                radius: 0.6, //圆形半径
                colors: <Color>[Colors.red, Colors.green, Colors.blue, Colors.grey],
              ),
              border: new Border.all(color: Colors.amber, width: 8.0),
              borderRadius: new BorderRadius.all(const Radius.circular(30.0)),
              boxShadow: <BoxShadow>[
                new BoxShadow(
                  color: Colors.grey,
                  blurRadius: 8.0, //模糊值
                  spreadRadius: 8.0, //扩散半径
                  offset: Offset(-1.0, 1.0), //偏移量
                )
              ],
            ),
            child: new Center(
              //Oval椭圆、RRect圆角、Rect矩形、Path路径
              child: ClipRRect(
//            clipper: RectClipper(),
//            clipper: TriangleCliper(),
                borderRadius: BorderRadius.all(Radius.circular(30.0)), //RRect角度

                child: RotatedBox(
                  quarterTurns: 1, //1=90度
                  child: new Image.network(
                    'https://www.baidu.com/img/bd_logo1.png?qua=high',
                  ),
                ),
              ),
            ),
          ),
        ),
      )

      ;
  }
}

/**
 * 矩形剪切
 * */
class RectClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    //裁剪范围
    return new Rect.fromLTRB(10, 10, size.width - 10, size.height - 10);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    //是否重新剪切
    return true;
  }
}

/*
*线性剪切——自定义三角形
 */
class TriangleCliper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = new Path();
    path.moveTo(50.0, 50.0);
    path.lineTo(50.0, 10.0);
    path.lineTo(100.0, 50.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
