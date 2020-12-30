
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(new TextFieldDemo() );
}

class TextFieldDemo extends StatefulWidget {
  @override
  State createState() {
    return _SetState();
  }
}


class _SetState extends State<TextFieldDemo>{
  var _statementDesc = "实名认证需要收集你的姓名，身份证号并采集面部信息，详见";
  var _statementName = "《用户隐私政策》";
  TapGestureRecognizer _privacyProtocolRecognizer;

  void _openPrivateProtocol() {
      print("112323");
  }
  @override
  void initState() {
    super.initState();
    _privacyProtocolRecognizer = TapGestureRecognizer();
  }

  @override
  void dispose() {
    super.dispose();
    _privacyProtocolRecognizer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return
      new MaterialApp(
          title: "my text demo",
          home: new Scaffold(
              appBar: new AppBar(
                title: new Text("文本控件"),
              ),
              body: Center(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _text(),
              SizedBox(height: 20.0),
              _textRich(),
              SizedBox(height: 20.0),
              _textField(),
              SizedBox(height: 20.0),
              Divider(
                //分割线
                color: Colors.grey,
                height: 52.0,
              ),
              _chipDemo()
            ],
          ))) //,
      )
     ;
  }

  _text(){
    return Text(
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
    );
  }

  _textRich(){//富文本
    //  LongPressGestureRecognizer _longPressGestureRecognizer;
    //    _longPressGestureRecognizer = new LongPressGestureRecognizer()
//    ..onLongPress = _handelLittleTapGes;
    return RichText(
      text: TextSpan(
        text: _statementDesc,
        style: TextStyle(color: Colors.grey, fontSize: 23),
        children: [
          TextSpan(
            text: _statementName,
            style: TextStyle(color: Colors.black),
            recognizer: _privacyProtocolRecognizer
              ..onTap = _openPrivateProtocol,
          )
        ],
      ),
    );
  }

  _textField(){
    //绑定数据
    final TextEditingController controller = TextEditingController();
    controller.addListener(() {
      print('${controller.text}');
    });
    return  TextField(
      controller: controller,
      maxLength: 30,
      //右下角出现输入数量统计字符串
      maxLines: 1,
      autocorrect: true, //是否自动更正
      autofocus: false, //是否自动对焦
      obscureText: false, //是否是密码
      cursorColor: Colors.red,//光标
      cursorRadius: Radius.circular(16.0),
      cursorWidth: 16.0,
      textAlign: TextAlign.center,
      inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
      textInputAction: TextInputAction.search,//提交按钮
      //允许的输入格式
      keyboardType: TextInputType.number,//.text（普通完整键盘）\emailAddress（带有“@”的普通键盘）\datetime（带有“/”和“：”的数字键盘）\.multiline（带有选项以启用有符号和十进制模式的数字键盘）
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
        //辅助提示
        helperText: '请输入文字',
        labelText: '请输入文字',
        hintText: '请输入文字',
        prefixIcon: Icon(Icons.edit),
        icon: Icon(Icons.person), //输入框左侧图标
        suffixIcon: Icon(Icons.chevron_right), //输入框内右侧图标
        suffixText: '输入', //文本提示
        border: InputBorder.none,//无底边
      ),
    );
  }

//小标签
  _chipDemo (){
    List<String> _tags = ['Apple', 'Banana', 'Lemon'];
    bool isCheck = true;

    return Center(
      child: Wrap(
        //wrap 代替row，可以设置间距和行距，自动换行
        spacing: 15.0,
        runSpacing: 2.0,
        children: <Widget>[
          Chip(
            label: Text('one'),
          ),
          ActionChip(
            label: Text('two'),
            backgroundColor: Colors.orange[300],
            onPressed: () {},
          ),
          ChoiceChip(
            selected: isCheck,
            onSelected: (value) {
              //value是选中状态
              isCheck = !isCheck;
              print(value);
            },
            selectedColor: Colors.blue[100],
            label: Text('three'),
            avatar: CircleAvatar(
              child: Text('阳'),
              backgroundColor: Colors.grey[100],
            ),
          ),
          FilterChip(
            label: Text('four'),
            avatar: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://avatar.csdnimg.cn/F/D/2/3_csdn_aiyang.jpg'),
            ),
            selected: isCheck, //未被选中
            onSelected: (value) {
              //value是选中状态
              isCheck = !isCheck;
              print(value);
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: _tags.map(
                  (tag) {
                return Chip(
                  label: Text(tag),
                  onDeleted: () {
                    _tags.remove(tag);
                  },
                  deleteIcon: Icon(Icons.delete_forever),
                  deleteIconColor: Colors.white,
                  deleteButtonTooltipMessage: 'remove this chip of tag',
                );
              },
            ).toList(),
          ),
        ],
      ),
    );

  }
}


