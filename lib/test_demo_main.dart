import 'package:flutter/material.dart';
import 'package:flutter_app/test/PickerDemo.dart';
import 'package:flutter_app/test/Slider_Demo.dart';
import 'common/toast.dart';
import 'test/Animated.dart';
import 'test/AppBar.dart';
import 'test/CanvasPaint.dart';
import 'test/Gesture.dart';
import 'test/Image.dart';
import 'test/ListView.dart';
import 'test/Navigator.dart';
import 'test/TextWidget.dart';
import 'test/Hero.dart';
import 'test/buttonDemo.dart';
import 'test/web_View.dart';
import 'test/widget_banner.dart';

/// 练习 Demo 入口
void main() => runApp(MyDemoApp());

class MyDemoApp extends StatelessWidget {
  //缺少控件的情形
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  //stateful 用于改变状态
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  ///创建情形。（注意首尾类 和对象 一致）
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Wrap(
              spacing: 18,
              runSpacing: 18,
              children: [
                _myButton("Button练习", 1),
                _myButton("Hero页面跳转", 2),
                _myButton("Text文本练习", 3),
                _myButton("页面跳转传值", 4),
                _myButton("动画练习", 5),
                _myButton("框架", 6),
                _myButton("步骤列表", 7),
                _myButton("ListView", 8),
                _myButton("GrideView", 9),
                _myButton("SliverView", 10),
                _myButton("画板Canvas", 11),
                _myButton("包装控件", 12),
                _myButton("stack层叠布局", 13),
                _myButton("图片裁剪", 14),
                _myButton("手势监听", 15),
                _myButton("滑动删除", 16),
                _myButton("Banner轮播图", 17),
                _myButton("WebViewPage", 18),
                _myButton("滑动进度条", 19),
                _myButton("滑动进度条", 20)

              ],
            ),
          ],
        )),
      ),
      floatingActionButton: _floatButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  _myButton(String txt, int page) {
    return RaisedButton(
      child: Text(txt),

      /// 配置跳转
      onPressed: () {
        switch (page) {
          case 1:
            _goPageRoute(MyButtonDemo());
            break;
          case 2:
            _goPageRoute(MyHeroDemo());
            break;
          case 3:
            _goPageRoute(TextFieldDemo());
            break;
          case 4:
            _goPageRoute(NavigatorDemo());
            break;
          case 5:
            _goPageRoute(AnimationPage());
            break;
          case 6:
            _goPageRoute(didiHome());
            break;
          case 7:
            _goPageRoute(StepperDemo());
            break;
          case 8:
            _goPageRoute(ListviewWidget());
            break;
          case 9:
            _goPageRoute(GrideView());
            break;
          case 10:
            _goPageRoute(SliverView());
            break;
          case 11:
            _goPageRoute(DrawPaint());
            break;
          case 12:
            _goPageRoute(LayoutDemo());
            break;
          case 13:
            _goPageRoute(StackDemo());
            break;
          case 14:
            _goPageRoute(ImageDemo());
            break;
          case 15:
            _goPageRoute(GestureDetection());
            break;
          case 16:
            _goPageRoute(ListDelDemo());
            break;
          case 17:
            _goPageRoute(ViewPagerDemo());
            break;
          case 18:
            _goPageRoute(WebViewPage());
            break;
          case 19:
            _goPageRoute(SliderDemo());
            break;
          case 20:
            _goPageRoute(PickerDemo());
            break;
        }
      },
      textColor: Colors.white,
      color: Colors.blue,
      splashColor: Colors.yellow[100],
      elevation: 2.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
    );
  }

  _goPageRoute(Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return page;
    }));
  }

  _floatButton() {
    return FloatingActionButton(
      onPressed: () {
//        Scaffold.of(context)
//            .showSnackBar(new SnackBar(content: Text('点赞了！真棒！～')));
        Toast.show("点赞了！真棒！～", context, gravity: Toast.CENTER);
      },
      foregroundColor: Colors.white,
      backgroundColor: Colors.blue,
      elevation: 7.0,
      //未点击阴影值
      highlightElevation: 14.0,
      //点击时阴影值
      shape: new CircleBorder(),
      //圆形边
      tooltip: 'FAB',
      child: Icon(Icons.nature_people),
    );
  }
}
