import 'package:flutter/material.dart';

void main(){
  runApp(new MaterialApp(
    title: 'dialog',
    home: new Scaffold(
      appBar: AppBar(title: Text('弹框训练'),),
//      body: new SimpleDemo(),
    body: new AlertDemo(),
    ),
  ));
}

class SimpleDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: const Text('提示'),
      children: <Widget>[
        SimpleDialogOption(
          onPressed: (){
            Scaffold.of(context).showSnackBar(new SnackBar(content: Text('ok1')));
          },
          child: const Text('第一行'),
        ),
        SimpleDialogOption(
          onPressed: (){
            Scaffold.of(context).showSnackBar(new SnackBar(content: Text('ok2')));
          },
          child: const Text('第二行'),
        )
      ],
    );
  }
}

class AlertDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('提示'),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text('第一条'),
            Text('又一条~')
          ],
        ),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text('确定'),
          onPressed: (){
            Scaffold.of(context).showSnackBar(new SnackBar(content: Text('确定了')));
          },
        ),
        FlatButton(
          child: Text('取消'),
          onPressed: (){
            Scaffold.of(context).showSnackBar(new SnackBar(content: Text('取消了')));
          },
        )
      ],
    );
  }
}