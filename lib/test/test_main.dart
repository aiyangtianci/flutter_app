import 'package:flutter/material.dart';

void main() => runApp(MyApp());

/**
 * 缺少控件的情形
 */
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
/**
 * 填充控件的情形
 */
class MyHomePage extends StatefulWidget {//stateful 用于改变状态
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  /**
   * 创建情形。（注意首尾类 和对象 一致）
   */
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You can clicked the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            MyButton(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          //改变界面
          setState(() {
            _counter++;
          });
        },
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
        elevation: 7.0,//未点击阴影值
        highlightElevation: 14.0,//点击时阴影值
        shape: new CircleBorder(),//圆形边
        tooltip: 'FAB',
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
/**
 * Flutter 可以通过 热重载（hot reload） 实现快速的开发周期，热重载就是无需重启应用程序就能实时加载修改后的代码，
 * 并且不会丢失状态。简单的对代码进行更改，然后告诉IDE或命令行工具你需要重新加载（点击reload按钮），
 * 你就会在你的设备或模拟器上看到更改。
 * 调用 Save (cmd-s / ctrl-s)，或者点击热重载按钮 (带有闪电⚡️图标的按钮)。
 * 你会立即在运行的应用程序中看到更新的字符串。
 */
class  MyButton extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
//        print('my button  was  tap');

        //snackBar
        Scaffold.of(context).showSnackBar(new SnackBar(content: Text('The counter Value ')));
      },
      child: Container(
        height: 36,
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.symmetric(horizontal: 18,vertical: 18),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.lightGreen[500],
        ),
        child: Center(
          child: Text("Hello 树哥"),
        ),

      ),
    );
  }
}
