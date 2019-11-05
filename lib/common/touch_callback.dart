import 'package:flutter/material.dart';

class TouchCallBack extends StatefulWidget {
  final Widget child;
  final VoidCallback onPressed;
  final bool isFeed;
  final Color background;

  TouchCallBack({this.child, this.onPressed, this.isFeed, this.background});

  @override
  TouchState createState() {
    return TouchState();
  }
}

class TouchState extends State<TouchCallBack> {
  Color color = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      child: Container(
        color: color,
        child: widget.child,
      ),
      onTap: widget.onPressed,
      onPanDown: (d) {
        if (widget.isFeed == false) return;
        setState(() {
          color = widget.background;
        });
      },
      onPanCancel: (){
        setState(() {
          color = Colors.transparent;
        });
      },
    );
  }
}
