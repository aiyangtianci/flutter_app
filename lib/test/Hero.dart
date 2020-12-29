import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      title: 'hero',
      home: MyHeroDemo(),
    ));

class MyHeroDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('首页'),
      ),
      body: GestureDetector(
        child: new Hero(
          tag: '第一张照片',
          child: new Image.network(
              'https://www.baidu.com/img/bd_logo1.png?qua=high'),
        ),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return SecondPage();
          }));
        },
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('跳转后页面'),
      ),
      body: GestureDetector(
        child: new Hero(
            tag: '第二张照片',
            child: Center(
              child: new Image.network(
                  'https://www.baidu.com/img/bd_logo1.png?qua=high'),
            )),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
