import 'package:flutter/material.dart';
import './common/touch_callback.dart';

/**
 * 搜索
 */
class Search extends StatefulWidget {
  @override
  SearchState createState() {
    return SearchState();
  }
}

class SearchState extends State<Search> {
  FocusNode focusNode = new FocusNode();

  //请求焦点
  _requestFocus() {
    FocusScope.of(context).requestFocus(focusNode);
    return focusNode;
  }

  //返回文本组件
  _getText(String txt) {
    return TouchCallBack(
      isFeed: false,
      onPressed: () {},
      child: Text(
        txt,
        style: TextStyle(fontSize: 14.0, color: Color(0xffb5b5b5)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Stack(
              children: <Widget>[
                TouchCallBack(
                  isFeed: false,
                  onPressed: () {
                    //使用导航器返回
                    Navigator.pop((context));
                  },
                  child: Container(
                    height: 45.0,
                    margin: const EdgeInsets.only(left: 12.0, right: 10.0),
                    child: Icon(
                      Icons.chevron_left,
                      color: Colors.black,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  height: 45.0,
                  margin: const EdgeInsets.only(left: 50.0, right: 10.0),
                  decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(width: 1.0, color: Colors.blue)),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: TextField(
                          focusNode: _requestFocus(),
                          style: TextStyle(color: Colors.black, fontSize: 16.0),
                          onChanged: (String text) {},
                          decoration: InputDecoration(
                              hintText: '搜索', border: InputBorder.none),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 10.0),
                        child: Icon(
                          Icons.mic,
                          color: Color(0xffaaaaa),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 50.0),
              child: Text(
                '常用搜索',
                style: TextStyle(fontSize: 16.0, color: Color(0xffb5b5b5)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Row(
                //对齐方式采用均匀对齐
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  _getText('朋友'),
                  _getText('聊天'),
                  _getText('群组'),
                  _getText('测试'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0,right: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  //第二行搜索
                  _getText('Flutter'),
                  _getText('Dart'),
                  _getText('C++'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
