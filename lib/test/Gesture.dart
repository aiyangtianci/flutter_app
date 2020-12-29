import 'package:flutter/material.dart';
import 'package:flutter_app/common/toast.dart';

void main() {
  runApp(new MaterialApp(
    title: '手势按钮',
    home: new ListDelDemo(),
  ));
}

///手势监听
class GestureDetection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('手势触摸事件'),
      ),
      body: new Center(
//        child: new GestureDetection(),
        child: GestureDetector(
          onTap: () {
            Toast.show("点赞了！真棒！～", context, gravity: Toast.CENTER);
//            Scaffold.of(context)
//                .showSnackBar(new SnackBar(content: new Text('按下事件触发')));
          },
          child: new Container(
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: Theme.of(context).buttonColor,
              borderRadius: new BorderRadius.circular(10.0),
            ),
            child: Text(
              '按钮',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ),
      ),
    );
  }
}

///滑动删除
class ListDel extends StatelessWidget {
  final List<String> items =
      new List<String>.generate(20, (i) => '列表项${i + 1}');

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return new Dismissible(
              key: new Key(item),
              onDismissed: (direction) {
                items.removeAt(index);
                Scaffold.of(context).showSnackBar(
                    new SnackBar(content: new Text('${item}被删除了')));
              },
              child: new ListTile(
                title: new Text('${item}'),
              ));
        });
  }
}

class ListDelDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text('手势触摸事件'),
      ),
      body: new Center(
//        child: new GestureDetection(),
        child: new ListDel(),
      ),
    );
  }
}
