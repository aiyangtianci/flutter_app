import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: OpacityApp(),
    );
  }
}
class OpacityApp extends StatefulWidget {
  final String title = 'Opacity透明训练';

  @override
  _MyHomePageState createState() =>_MyHomePageState();//这里如过不用这种写法会出错，不知道为什么
}

class _MyHomePageState extends State<OpacityApp> {
  bool _visible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: AnimatedOpacity(
          opacity: _visible ? 1.0 : 0.0,
          duration: Duration(milliseconds: 1000),
          child: Container(
            width: 300.0,
            height: 300.0,
            color: Colors.deepPurple,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _visible=!_visible;
          });
        },
        tooltip: '显示隐藏',
        child: new Icon(Icons.flip),
      ),
    );
  }
}
