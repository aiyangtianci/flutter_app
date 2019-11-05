

import 'package:flutter/material.dart';
import './touch_callback.dart';

//通用列表项

class ImItem extends StatelessWidget{

  final String title;
  final String imagePath;
  final Icon icon;

  ImItem({Key key ,@required this.title, this.imagePath, this.icon}):super(key:key);

  @override
  Widget build(BuildContext context) {

      return TouchCallBack(
        onPressed: (){
          if(title == '好友动态'){
            Navigator.pushNamed(context, 'sliver');
          }else{
            final snakbar = new SnackBar(content: new Text('按下事件触发'));
            Scaffold.of(context).showSnackBar(snakbar);
          }
        },
        child: Container(
          height: 50.0,
          child: Row(
            children: <Widget>[
              //图片
              Container(
                child: imagePath!=null?Image.asset(imagePath,width: 30.0,height: 30.0,):SizedBox(height: 32.0,width: 32.0,child: icon,),
                margin: const EdgeInsets.only(left: 22.0,right: 20.0),
              ),
              Text(
                title,style: TextStyle(fontSize: 16.0,color: Color(0xff353535)),
              ),
            ],
          ),
        ),
      );
  }
}