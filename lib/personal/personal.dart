import 'package:flutter/material.dart';
import '../common/im_item.dart';
import '../common/touch_callback.dart';
import 'package:flutter_app/info/picture.dart';

//我的页面
class Personal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 20.0),
            color: Colors.white,
            height: 80.0,
            //换头像
            child: TouchCallBack(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  //头像
                  Container(
                    margin: const EdgeInsets.only(left: 12.0, right: 12.0),
                    child: Hero(
                      tag: (){},
                      child: ClipRRect(
                        borderRadius: new BorderRadius.all(Radius.circular(30.0)),
                        child: Image.asset(
                          'images/xiaoxin.jpg',
                          width: 60.0,
                          height: 60.0,
                        ),
                      ),
                    ),

                  ),
                  //用户名\账号
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '蜡笔小新',
                          style: TextStyle(
                              fontSize: 18.0, color: Color(0xff353535)),
                        ),
                        Text(
                          'nihao flutter'.toUpperCase(),
                          style: TextStyle(
                              fontSize: 14.0, color: Color(0xffa9a9a9)),
                        ),
                      ],
                    ),
                  ),
                  //二维码
                  Container(
                    margin: const EdgeInsets.only(left: 12.0, right: 15.0),
                    child: Image.asset(
                      'images/qq.png',
                      width: 55.0,
                      height: 55.0,
                    ),
                  ),
                ],
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return new PictureInfo('images/qq.png','欢迎入群！', false,);
                }));
              },
            ),
          ),

          //使用ImItem渲染

          Container(
            margin: const EdgeInsets.only(top: 20.0),
            color: Colors.white,
            child: ImItem(
              title: '好友动态',
              imagePath: 'images/icon_finds.png',
            ),
          ),

          Container(
            margin: const EdgeInsets.only(top: 20.0),
            color: Colors.white,
            child: Column(
              children: <Widget>[
                ImItem(
                  imagePath: 'images/icon_mess.png',
                  title: '消息管理',
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Divider(
                    height: 0.5,
                    color: Color(0xffd9d9d9),
                  ),
                ),
                ImItem(
                  imagePath: 'images/icon_photo.png',
                  title: '我的相册',
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Divider(
                    height: 0.5,
                    color: Color(0xffd9d9d9),
                  ),
                ),
                ImItem(
                  imagePath: 'images/icon_file.png',
                  title: '我的文件',
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Divider(
                    height: 0.5,
                    color: Color(0xffd9d9d9),
                  ),
                ),
                ImItem(
                  imagePath: 'images/icon_service.png',
                  title: '联系客服',
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20.0),
            color: Colors.white,
            child:ImItem(
              imagePath: 'images/icon_delete.png',
              title: '清理缓存',
            ),
          ),
        ],
      ),
    );
  }
}
