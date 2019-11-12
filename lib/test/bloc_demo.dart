import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    title: 'bloc',
    home: Scaffold(
      appBar: AppBar(
        title: Text('bloc训练'),
      ),
      body: BlocDemo(),
    ),
  ));
}

class BlocDemo extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

  }
}