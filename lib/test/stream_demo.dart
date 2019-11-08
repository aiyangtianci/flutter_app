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
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
