import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

void main() {
  runApp(MaterialApp(
    title: 'http',
    home: Scaffold(
      appBar: AppBar(
        title: Text('http训练'),
      ),
      body: HttpDemo(),
    ),
  ));
}

class HttpDemo extends StatefulWidget {
  @override
  HttpState createState() => HttpState();
}

class HttpState extends State<HttpDemo> {
  @override
  void initState() {
    super.initState();
    fetchPost().then((onValue) => print(onValue.message));
    //map数组
//    final post = {
//      'name': '李白',
//    };
//    print(post['name']);
//    //map转json
//    final jsonPost = json.encode(post);
//    print(jsonPost);
//    //json转map
//    final mapPost = json.decode(jsonPost);
//    print(mapPost is Map);
//    //解析map
//    final postModel = Acount._fromjson(mapPost);
//    print("name:${postModel.name}");
//    //转json，encode自动调用类中的toJson（）
//    print("${json.encode(postModel)}");
  }

  Future<_Response> fetchPost() async {
    final response = await http.get('https://api.apiopen.top/singlePoetry');
    print("statusCode:${response.statusCode} \r\n  body:${response.body}");
    if (response.statusCode == 200) {
      final _responseBody = json.decode(response.body);
      print(_responseBody);
      final _result = _Response._fromjson(_responseBody);
      return _result;
    } else {
      throw ('Failed to fetchPost');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder(
          future: fetchPost(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return Container(
              child: Text('data: ${snapshot.data.toString()}'),
            );
          }),
    );
  }
}

class Acount {
  String name;

  Acount(this.name);

  Acount._fromjson(Map json) : name = json['name'];

  Map toJson() => {
        'name': name,
      };
}

class _Response {
  int code;
  String message;
  String result;

  _Response(this.code, this.message, this.result);

  _Response._fromjson(Map json)
      : code = json['code'],
        message = json['message'],
        result = json['result'];
}
