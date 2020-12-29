import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/common/string.dart';
class Toast {
  static final int BOTTOM = 0;
  static final int CENTER = 1;
  static final int TOP = 2;

  static void show(String msg, BuildContext context,
      {double duration = 1800,
      int gravity = 2,
      Color backgroundColor = const Color(0xFFFFFFF),
      Color textColor = const Color(0xFF070707),
      double backgroundRadius = 20,
      Border border,
      bool showIcon = false}) {
    if (StringUtils.isEmpty(msg)) return;

    try {
      ToastView.dismiss();
      ToastView.createView(msg, context, duration, gravity, backgroundColor,
          textColor, backgroundRadius, border, showIcon);
    } catch (e) {
      print(e);
    }
  }
}

class ToastView {
  static final ToastView _singleton = new ToastView._internal();

  factory ToastView() {
    return _singleton;
  }

  ToastView._internal();

  static OverlayState overlayState;
  static OverlayEntry _overlayEntry;
  static bool _isVisible = false;

  static void createView(
      String msg,
      BuildContext context,
      double duration,
      int gravity,
      Color background,
      Color textColor,
      double backgroundRadius,
      Border border,
      bool icon) async {
    overlayState = Overlay.of(context);

    Paint paint = Paint();
    paint.strokeCap = StrokeCap.square;
    paint.color = background;

    Border defaultBorder = Border.all(color: Color(0xFFFFDD58), width: 0.5);
    Timer timer = Timer(Duration(milliseconds: duration.round()), () {
      dismiss();
    });

    List<Widget> children = List();
    if (icon == true) {
      children
        ..add(Container(
          width: 14,
          height: 14,
          decoration: BoxDecoration(
            color: Color(0xFFFFC600),
            borderRadius: BorderRadius.circular(7),
          ),
          child: Center(
            child: Text('!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                )),
          ),
        ))
        ..add(Padding(padding: EdgeInsets.only(right: 10)));
    }
    children.add(
      Text(
        msg,
//        softWrap: true,
        style: TextStyle(fontSize: 15, color: textColor),
      ),
    );

    _overlayEntry = new OverlayEntry(
      builder: (BuildContext context) => ToastWidget(
          widget: GestureDetector(
            onTap: () {
              dismiss();
              timer.cancel();
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.transparent,
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(backgroundRadius),
                    border: border ?? defaultBorder,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 8.0,
                        offset: Offset(1, 2.5),
                      )
                    ],
                  ),
                  padding: EdgeInsets.fromLTRB(22, 10, 22, 10),
                  child: Text(
                    msg,
                    style: TextStyle(fontSize: 15, color: textColor),
                  ),
                ),
              ),
            ),
          ),
          gravity: gravity),
    );
    _isVisible = true;
    overlayState.insert(_overlayEntry);
  }

  static dismiss() async {
    if (!_isVisible) {
      return;
    }
    _isVisible = false;
    _overlayEntry?.remove();
  }
}

class ToastWidget extends StatelessWidget {
  ToastWidget({
    Key key,
    @required this.widget,
    @required this.gravity,
  }) : super(key: key);

  final Widget widget;
  final int gravity;

  @override
  Widget build(BuildContext context) {
    return new Positioned(
        top: gravity == 2 ? 55 + window.padding.top : null,
        bottom: gravity == 0 ? 80 + window.padding.bottom : null,
        child: Material(
          color: Colors.transparent,
          child: widget,
        ));
  }
}
