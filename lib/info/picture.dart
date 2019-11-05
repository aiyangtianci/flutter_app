import 'package:flutter/material.dart';

class PictureInfo extends StatelessWidget {
  String avatar;
  String title;
  bool isNetwork = true;

  PictureInfo(this.avatar, this.title, this.isNetwork);

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              SizedBox(height: 76.0),
              Text(
                title,textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,decorationStyle:TextDecorationStyle.double,
              ),
              ),
              SizedBox(height: 36.0),
              new Container(
                width: 300,
                height: 300,
                decoration: new BoxDecoration(
//          border: new Border.all(color: Colors.grey, width: 0.0),
                  borderRadius:
                      new BorderRadius.all(const Radius.circular(20.0)),
                  boxShadow: <BoxShadow>[
                    new BoxShadow(
                      color: Colors.grey,
                      blurRadius: 8.0, //模糊值
                      spreadRadius: 8.0, //扩散半径
                      offset: Offset(-1.0, 1.0), //偏移量
                    )
                  ],
                ),
                child: CircleAvatar(
                  backgroundImage: isNetwork == true
                      ? NetworkImage(
                    avatar,
                  )
                      : AssetImage(
                    avatar,
                  ),
                ),
              ),

            ],
          ),
          Positioned.fill(child: Material(
            color: Colors.transparent,
              child: new Hero(
                tag: title,
                child: InkWell(
                  splashColor: Colors.white.withOpacity(0.3),
                  highlightColor: Colors.white.withOpacity(0.1),
                  onTap: (){
                    Navigator.pop(context);
                  },
                ),
              ),

          ))
        ],
      ),
    );
  }
}
