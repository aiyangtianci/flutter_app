import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'flash.dart';
import './app.dart';
import 'package:flutter_app/search/search.dart';
import 'package:flutter_app/info/sliver.dart';


void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '聊天室',
      theme: ThemeData(
        primaryColor: Colors.blue,
        scaffoldBackgroundColor: Color(0xFFebebeb),
        cardColor: Colors.blue,
//        primarySwatch: Colors.yellow
      ),
      routes: <String, WidgetBuilder>{
        "app":(BuildContext context) => new MyAPP(),
        "search":(BuildContext context) => new Search(),
        "sliver":(BuildContext context) => new SliverView(),
        "/friends": (_) => WebviewScaffold(
              url: "https://blog.csdn.net/csdn_aiyang",
              appBar: AppBar(
                title: Text('动态'),
              ),
              withZoom: true,
              hidden: true,
              withLocalStorage: true,
              initialChild: Container(
                color: Colors.grey,
                child: const Center(
                  child: Text('Waiting.....'),
                ),
              ),
            ),
      },
      home: FlashPage(),
    ));
