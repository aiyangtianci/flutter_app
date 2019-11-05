import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import './contact_vo.dart';

/**
 * 渲染好友列表
 */
class ContactSiderList extends StatefulWidget {
  final List<ContactVO> items;

  final IndexedWidgetBuilder headerBuilder;

  final IndexedWidgetBuilder itemBuilder;

  final IndexedWidgetBuilder sectionBuilder;

  ContactSiderList(
      {Key key,
      @required this.items,
      @required this.headerBuilder,
      @required this.itemBuilder,
      @required this.sectionBuilder})
      : super(key: key);

  @override
  ContactState createState() => ContactState();
}

class ContactState extends State<ContactSiderList> {
  final ScrollController _scrollController = new ScrollController();

  bool _onNotification(ScrollNotification notification) {
    return true;
  }

  //判断显示头部视图或容器
  _isShowHeaderView(index) {
    if (index == 0 && widget.headerBuilder != null) {
      return Offstage(
        offstage: false,
        child: widget.headerBuilder(context, index),
      );
    }
    return Container();
  }

  //根据定位判断是否显示好友表头
  bool _shouldShowHeader(int postion) {
    if (postion <= 0) {
      return false;
    } else if (postion != 0 &&
        widget.items[postion].seationKey !=
            widget.items[postion - 1].seationKey) {
      return false;
    } else {
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          NotificationListener(
            onNotification: _onNotification,
            child: ListView.builder(
              controller: _scrollController,
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: widget.items.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    children: <Widget>[
                      //显示列表头
                      _isShowHeaderView(index),
                      //用Offstage组件控制是否显示英文字母
                      Offstage(
                        offstage: _shouldShowHeader(index),
                        child: widget.sectionBuilder(context, index),
                      ),
                      //显示列表项
                      Column(
                        children: <Widget>[widget.itemBuilder(context, index)],
                      ),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
