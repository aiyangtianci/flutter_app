import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/chat/message_data.dart';
import 'package:flutter_app/common/toast.dart';
import 'package:flutter_app/common/touch_callback.dart';

/// ViewPager Banner图
void main() => runApp(ViewPagerDemo());

class ViewPagerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '列表',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: new CustomBanner([
        new MessageData(
            'http://b-ssl.duitang.com/uploads/item/201803/29/20180329184955_QdjNa.jpeg',
            '高冷',
            '看我胳膊上的伤疤没?。',
            new DateTime.now(),
            MessageType.CHAT),
        new MessageData(
            'http://b-ssl.duitang.com/uploads/item/201702/25/20170225142651_8RfCe.jpeg',
            '仙儿',
            '像不像刘亦菲？',
            new DateTime.now(),
            MessageType.CHAT),
        new MessageData(
            'http://b-ssl.duitang.com/uploads/item/201610/15/20161015220939_hfN4t.jpeg',
            '撩儿',
            '这手指勾的啊。。。~~',
            new DateTime.now(),
            MessageType.CHAT),
      ]),
    );
  }
}

//ViewPager 轮播图
class CustomBanner extends StatefulWidget {
  final List<MessageData> _images;
  double height;
  final int onTap;
  var curve;
  int defaultCurIndex;

  CustomBanner(this._images,
      {this.height = 230,
      this.onTap,
      this.curve = Curves.linear,
      this.defaultCurIndex = 0})
      : assert(_images != null);

  @override
  State createState() {
    return SetState();
  }
}

class SetState extends State<CustomBanner> {
  int _pageLength;
  Timer _timer;
  PageController _pageController;
  int _curIndex;

  @override
  void initState() {
    super.initState();
    _curIndex = widget.defaultCurIndex;
    _pageLength = widget._images.length;
    _pageController = PageController(
      viewportFraction: 0.9, //站屏比例
      initialPage: widget.defaultCurIndex, //默认加载项
    );
   _initTimer();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _timer.cancel();
    _timer = null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('banner'),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 25.0),
        child: _buildPageView(),
      ),
    );
  }

  Widget _buildPageView() {
    return Container(
        height: widget.height,
        child: Stack(
          children: [
            PageView.builder(
              scrollDirection: Axis.horizontal, //水平或垂直
              controller: _pageController,
              onPageChanged: (index) {
                //页面改变
                print("index:" + index.toString());
                setState(() {
                  _curIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return GestureDetector(
                    onPanDown: _cancelTimer(),
                    child: TouchCallBack(
                      child: Image.network(
                        widget._images[index % _pageLength].avatar,
                        fit: BoxFit.cover,
                      ),
                      onPressed: () {
                        Toast.show("当前page为～${_curIndex %_pageLength}", context,
                            gravity: Toast.CENTER);
                      },
                    ));
              },
            ),
            Positioned(
                bottom: 10,
                left: 0,
                right: 0,
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(_pageLength, (index) {
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: (_curIndex %_pageLength) == index
                                ? Colors.blue
                                : Colors.white),
                      );
                    }).toList(),
                  ),
                ))
          ],
        ));
  }

  _cancelTimer() {
    if (_timer != null) {
      _timer.cancel();
      _timer = null;
      _initTimer();
    }
  }

  //定时器
  void _initTimer() {
    _timer = Timer.periodic(Duration(seconds: 3), (t) {
      _curIndex++;
      print("curIndex:" + _curIndex.toString());
      _pageController.animateToPage(
        _curIndex,
        duration: Duration(milliseconds: 300),
        curve: Curves.linear,
      );
    });
  }

}
