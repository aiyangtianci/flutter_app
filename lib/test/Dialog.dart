import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    title: 'dialog',
    home: new Scaffold(
//      key: _bottomSheetScaffotKey,
      appBar: AppBar(
        title: Text('弹框训练'),
      ),
//      body: new SimpleDemo(),
      body: new ExpansionPanelDemo(),
    ),
  ));
}

/**
 * 单选框
 */
class SimpleDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: const Text('提示'),
      children: <Widget>[
        SimpleDialogOption(
          onPressed: () {
            Scaffold.of(context)
                .showSnackBar(new SnackBar(content: Text('ok1')));
          },
          child: const Text('第一行'),
        ),
        SimpleDialogOption(
          onPressed: () {
            Scaffold.of(context)
                .showSnackBar(new SnackBar(content: Text('ok2')));
          },
          child: const Text('第二行'),
        )
      ],
    );
  }
}

/**
 * 提示框
 */
class AlertDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('提示'),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[Text('第一条'), Text('又一条~')],
        ),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text('确定'),
          onPressed: () {
            Scaffold.of(context)
                .showSnackBar(new SnackBar(content: Text('确定了')));
          },
        ),
        FlatButton(
          child: Text('取消'),
          onPressed: () {
            Scaffold.of(context)
                .showSnackBar(new SnackBar(content: Text('取消了')));
          },
        )
      ],
    );
  }
}

/**
 * 底部自定义弹框
 */
class BottomSheetDemo extends StatefulWidget {
  @override
  _BottomSheetDemoState createState() {
    return _BottomSheetDemoState();
  }
}

final _bottomSheetScaffotKey = GlobalKey<ScaffoldState>();

_openBottomSheet() {
  _bottomSheetScaffotKey.currentState.showBottomSheet((BuildContext context) {
    return BottomAppBar(
      child: Container(
        height: 100.0,
        width: double.infinity,
        padding: EdgeInsets.all(15.0),
        child: Row(
          children: <Widget>[
            Icon(Icons.pause_circle_filled),
            SizedBox(
              width: 16.0,
            ),
            Text('01:30  /  04:25'),
            Expanded(
              child: Text(
                'I Bliver I can fly-eglish',
                textAlign: TextAlign.right,
              ),
            ),
          ],
        ),
      ),
    );
  });
}

/**
 * 短暂显示在底部  ，类似SnackBar
 */
class _BottomSheetDemoState extends State<BottomSheetDemo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(18.0),
      alignment: Alignment.center,
      child: FlatButton(
          onPressed: () {
            _openBottomSheet();
//            Scaffold.of(context).showSnackBar(
//              new SnackBar(
//                content: Text('SnackBar'),
//                action: SnackBarAction(label: 'OK', onPressed: (){}),
//              ),
//            );
          },
          child: Text('Open the Dow')),
    );
  }
}

/**
 * 伸缩弹框
 */
class ExpansionPanelDemo extends StatefulWidget {

  @override
  _ExpansipanelState createState() {
      return _ExpansipanelState();
  }
}
class _ExpansipanelState extends State<ExpansionPanelDemo>{
  bool _isExpanded =  false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          //这里有个问题，它必须得放到列表widget中
          ExpansionPanelList(
            expansionCallback: (int panelIndex,bool isExpanded){
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            children: [
              ExpansionPanel(
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return Container(
                    padding: EdgeInsets.all(15.0),
                    child: Text('panel A'),
                  );
                },
                body: Container(
                  padding: EdgeInsets.all(15.0),
                  width: double.infinity,
                  child: Text('panel B'),
                ),
                isExpanded: _isExpanded,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
