import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/common/base_title_widget.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {

  const WebViewPage({this.titleName = "WebView",this.url="https://blog.csdn.net/csdn_aiyang"});

  final String titleName ;

  final String url;

  @override
  State createState() {
    return  SetState();
  }
}

class SetState extends State<WebViewPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: Container(
          margin: const EdgeInsets.only(top: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              MeTitleWidget(widget.titleName),
              _webViewBrowserWidget()
            ],
          ),
        ),
      );
  }


  _webViewBrowserWidget(){
    return  Expanded(
      child:WebView(
        initialUrl: widget.url,
        javascriptMode: JavascriptMode.unrestricted,
      ),

    );
  }
}




