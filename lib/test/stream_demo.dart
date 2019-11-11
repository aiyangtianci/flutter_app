import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Stream',
    home: StreamDemo(),
  ));
}

class StreamDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StreamDemo'),
      ),
      body: StreamDemoHome(),
    );
  }
}

class StreamDemoHome extends StatefulWidget {
  @override
  _StreamDemoState createState() => _StreamDemoState();
}

class _StreamDemoState extends State<StreamDemoHome> {
  StreamSubscription _streamSubscription;
  StreamController<String> _streamController;
  StreamSink<String> _streamSink;
  String _data = '';

  @override
  void initState() {
    super.initState();
    //定义Stream
//    Stream<String> _streamDemo = Stream.fromFuture(fetchData());
//    _streamSubscription = _streamDemo.listen(onData, onError: onError, onDone: onDone);

    //控制Stream
//    _streamController = StreamController<String>();
    _streamController = StreamController.broadcast(); //多次订阅
    _streamSink = _streamController.sink;
    _streamSubscription = _streamController.stream
        .listen(onData, onError: onError, onDone: onDone);
    _streamController.stream
        .listen(onDataTwo, onError: onError, onDone: onDone);
  }

  @override
  void dispose() {
    //关闭控制
    _streamController.close();
    super.dispose();
  }

  void onDone() {
    print("Done");
  }

  void onError(error) {
    print(error);
  }

  void onData(String data) {
    print(data);
    setState(() {
      _data = data;
    });
  }

  void onDataTwo(String datatwo) {
    print("StreamTwo:" + datatwo);
  }

  Future<String> fetchData() async {
    await Future.delayed(Duration(seconds: 3));
    return "hello`~~";
  }

  void _onAddStream() async {
    print('Add data to Stream');
    String data = await fetchData();
//    _streamController .add(data);
    _streamSink.add(data);
  }

  void _onPauseStream() {
    print('paush subscription');
    _streamSubscription.pause();
  }

  void _onResumeStream() {
    print('resume subscription');
    _streamSubscription.resume();
  }

  void _onCancelStream() {
    print('cancel subscription');
    _streamSubscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            StreamBuilder(
              stream: _streamController.stream,
              initialData: '无须手动setState',
              builder: (context, snapshot) {
      return Text(snapshot.data);
              },
            ),
            Text(_data),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                    onPressed: () {
                      _onAddStream();
                    },
                    child: Text('Add')),
                FlatButton(
                    onPressed: () {
                      _onPauseStream();
                    },
                    child: Text('Pause')),
                FlatButton(
                    onPressed: () {
                      _onResumeStream();
                    },
                    child: Text('Resume')),
                FlatButton(
                    onPressed: () {
                      _onCancelStream();
                    },
                    child: Text('Cancel')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
