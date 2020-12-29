

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/common/CommonUtil.dart';

import 'touch_callback.dart';

/// 标题
class MeTitleWidget extends StatelessWidget {
  final String titleName;
  final bool noShowBackIcon;

  const MeTitleWidget(
      this.titleName, {
        Key key,
        this.noShowBackIcon=false
      }) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        TouchCallBack(
          isFeed: false,
          onPressed: () {
            Navigator.pop((context));
          },
          child:noShowBackIcon?CommonUtil.empty():Container(
            height: 55.0,
            margin: const EdgeInsets.only(left: 12.0, right: 10.0),
            child: Icon(
              Icons.chevron_left,
              color: Colors.black,
            ),
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          height: 55.0,
          margin: const EdgeInsets.only(left: 0.0, right: 0.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                titleName,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight:
                    Platform.isIOS ? FontWeight.w500 : FontWeight.w400),
              ),
            ],
          ),
        ),
      ],
    );
  }

}