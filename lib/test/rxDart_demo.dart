import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:async';
//rx = reactive extensions  响应式编程

void main() {
  runApp(MaterialApp(
    title: 'rxDart',
    home: Scaffold(
      appBar: AppBar(
        title: Text('rxDart'),
      ),
      body: RxDartDemo(),
    ),
  ));
}

class RxDartDemo extends StatefulWidget {
  @override
  RxDartState createState() {
    return RxDartState();
  }
}

class RxDartState extends State<RxDartDemo> {
  PublishSubject<String> _subject;

  @override
  void initState() {
    super.initState();
    Observable<String> _observable =
//    Observable(Stream.fromIterable(["hello","你好"]));
//    Observable.fromFuture(Future.value('hello'));
//    Observable.fromIterable(["hello","nihao"]);
//    Observable.just("hello");
//    Observable.periodic(Duration(seconds: 3),(x)=>x.toString());
//    _observable.listen(print);

    _subject = PublishSubject<String>(); //add之后的listen 收不到之前的add
//    ReplaySubject<String> _subject =  ReplaySubject<String>(maxSize: 3);//listen 接收所有的add，maxsize限制最后add数量
    _subject.add('hello');
    _subject.add('hola');
    _subject
        .map((convert) => 'map convert=>$convert')//转换
        .listen((data) => print('listen 1:$data'));
    _subject
        .where((test) => test.length > 9)//条件
        .listen((data) => print('listen 2:${data.toUpperCase()}'));

    _subject
        .debounceTime(Duration(milliseconds: 500))//防抖动
        .listen((data) => print('listen 3:$data'));

    _subject.add('hi');
  }

  @override
  void dispose() {
    _subject.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: TextField(
          onChanged: (value) {
            _subject.add("changed: $value");
          },
          onSubmitted: (value) {
            _subject.add("submitted : $value");
          },
          decoration: InputDecoration(
            helperText: '请输入',
            labelText: "输入监听测试",
            filled: true,
            fillColor: Colors.amberAccent,
          ),
        ),
      ),
    );
  }
}
