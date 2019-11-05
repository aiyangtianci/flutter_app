import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
      title: "my text demo",
      home: new Scaffold(
          appBar: new AppBar(
            title: new Text("文本控件"),
          ),
//        body: new TextDemo()
          body: new TextFieldDemo()) //,
      ));
}

class TextFieldDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    controller.addListener(() {
      print('${controller.text}');
    });

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: TextField(
          controller: controller,
          maxLength: 30,
          //右下角出现输入数量统计字符串
          maxLines: 1,
          autocorrect: true,
          autofocus: true,
          obscureText: false,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 26.0, color: Colors.green),
          onChanged: (text) {
            print('文本内容改变${text}');
          },
          onSubmitted: (text) {
            print('文本内容提交${text}');
          },
          enabled: true,
          //是否禁用
          decoration: InputDecoration(
            //装饰
            fillColor: Colors.grey[200],
            filled: true,
            helperText: '请输入文字',
            //辅助提示
            prefixIcon: Icon(Icons.edit),
            suffixText: '输入', //文本提示
          ),
        ),
      ),
    );
  }
}

class TextDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Column(
      //纵队，列
      children: <Widget>[
        new Text(
          "红色 黑色删除线 25号",
          style: new TextStyle(
              color: const Color(0xffff0000),
              decoration: TextDecoration.underline,
              decorationColor: const Color(0xff000000),
              decorationStyle: TextDecorationStyle.dashed,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
              letterSpacing: 10 //空隙
              ),
        ),
      ],
    );
  }
}

class RichTextDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RichText(
      text: TextSpan(
        text: "红色 黑色删除线 25号",
        style: new TextStyle(
            backgroundColor: const Color(0xffff0000),
            decoration: TextDecoration.underline,
            decorationColor: const Color(0xff000000),
            decorationStyle: TextDecorationStyle.dashed,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
            letterSpacing: 10 //空隙
            ),
        children: [
          TextSpan(
            text: '子view，继承父style,也可以自定义',
            style: TextStyle(
              fontWeight: FontWeight.w300,
            )
          ),
        ],
      ),
    );
  }
}
