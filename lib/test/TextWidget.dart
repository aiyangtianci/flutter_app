import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
      title: "my text demo",
      home: new Scaffold(
          appBar: new AppBar(
            title: new Text("文本控件"),
          ),
          body: new ChipDemo()) //,
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
              )),
        ],
      ),
    );
  }
}
//小标签
class ChipDemo extends StatelessWidget {
  List<String> _tags = ['Apple','Banana','Lemon'];
  bool isCheck = true;

  @override
  Widget build(BuildContext context) {
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
            onPressed: (){

            },
          ),
          ChoiceChip(
            selected: isCheck,
            onSelected: (value){//value是选中状态
              isCheck =!isCheck;
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
            selected: isCheck,//未被选中
            onSelected: (value){//value是选中状态
                isCheck =!isCheck;
                print(value);
            },

          ),
          Divider(
            //分割线
            color: Colors.grey,
            height: 52.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _tags.map((tag){
            return Chip(
              label:Text(tag),
              onDeleted: () {
                _tags.remove(tag);
              },
              deleteIcon: Icon(Icons.delete_forever),
              deleteIconColor: Colors.white,
              deleteButtonTooltipMessage: 'remove this chip of tag',
            );
            },).toList(),
          ),
        ],
      ),
    );
  }
}
