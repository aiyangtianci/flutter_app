import 'package:flutter/material.dart';

void main() => runApp(new MaterialApp(
      title: 'drawer',
      home: DrawPaint(),
    ));

class DrawPaint extends StatelessWidget {
  //shift/command+return 换行

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('画板'),
      ),
      body: Center(
        child: SizedBox(
          width: 500.0,
          height: 500.0,
          child: Column(
            children: <Widget>[
              CustomPaint(
                painter: LinePainter(),
                child: Center(
                  child: Text('绘制直线'),
                ),
              ),
              CustomPaint(
                painter: CirclePainter(),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 80, 0, 0),
                  child: Center(
                    child: Text('绘制圆'),
                  ),
                ),
              ),
              CustomPaint(
                painter: OvalPainter(),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 100, 0, 0),
                  child: Center(
                    child: Text('绘制椭圆'),
                  ),
                ),
              ),
              CustomPaint(
                painter: RectPainter(),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 120, 0, 0),
                  child: Center(
                    child: Text('绘制矩形'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/**
 * 画直线
 */
class LinePainter extends CustomPainter {
  Paint _paint = new Paint()
    ..color = Colors.black
    ..strokeCap = StrokeCap.round //笔触类型
    ..isAntiAlias = true //抗锯齿
    ..strokeWidth = 15.0 //粗细
    ..style = PaintingStyle.fill; //是否填充，默认填充fill

  @override
  void paint(Canvas canvas, Size size) {
    //前 和 后 两个point点x\y偏移量
    canvas.drawLine(Offset(50.0, 50.0), Offset(320.0, 50.0), _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false; //是否重绘
  }
}

/**
 * 绘制圆
 */
class CirclePainter extends CustomPainter {
  Paint _paint = new Paint()
    ..color = Colors.green
    ..strokeCap = StrokeCap.square //笔触类型
    ..isAntiAlias = true //抗锯齿
    ..strokeWidth = 5.0 //粗细
    ..style = PaintingStyle.stroke; //是否填充，默认填充fill

  @override
  void paint(Canvas canvas, Size size) {
    //x偏移和y偏移量，半径大小，画笔
    canvas.drawCircle(Offset(180.0, 150.0), 40.0, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false; //是否重绘
  }
}
/**
 * 绘制椭圆
 */
class OvalPainter extends CustomPainter {
  Paint _paint = new Paint()
    ..color = Colors.green
    ..strokeCap = StrokeCap.round //笔触类型
    ..isAntiAlias = true //抗锯齿
    ..strokeWidth = 5.0 //粗细
    ..style = PaintingStyle.fill; //是否填充，默认填充fill

  @override
  void paint(Canvas canvas, Size size) {
    //x y 偏移量左上，后面相对
    Rect rect = Rect.fromPoints(Offset(70.0, 130.0), Offset(300.0, 220.0));
    canvas.drawOval(rect,_paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false; //是否重绘
  }
}

/**
 * 绘制矩形
 */
class RectPainter extends CustomPainter {
  Paint _paint = new Paint()
    ..color = Colors.green
    ..strokeCap = StrokeCap.round //笔触类型
    ..isAntiAlias = true //抗锯齿
    ..strokeWidth = 5.0 //粗细
    ..style = PaintingStyle.fill; //是否填充，默认填充fill

  @override
  void paint(Canvas canvas, Size size) {
    //中心点坐标 ，边长
    Rect rect = Rect.fromCircle(center: Offset(180.0, 220.0),radius: 50);
    RRect rRect = RRect.fromRectAndRadius(rect, Radius.circular(20.0));//角度
    canvas.drawRRect(rRect,_paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false; //是否重绘
  }
}