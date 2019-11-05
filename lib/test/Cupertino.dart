import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
    title: 'Cupertino训练',
    home: MyPage(),
));

class dialog extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
      return Column(
        children: <Widget>[
          CupertinoActivityIndicator(
            radius: 30.0,//等待圈，值大图大
          ),

          CupertinoAlertDialog(
            title: Text('提示'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('文本1'),
                  Text('文本2')
                ],
              ),
            ),
            actions: <Widget>[
              CupertinoDialogAction(
                child: Text('确定'),
                onPressed: (){
                  print('确定了');
                },
              ),
              CupertinoDialogAction(
                child: Text('取消'),
                onPressed: (){
                  print('取消了');
                },
              )
            ],
          ),
          CupertinoButton(
            child: Text('Cupertino按钮'),
            color: Colors.blue,
            onPressed: (){
              print('onPressed');
            },
          )
        ],
      );
  }
}

class MyPage extends StatefulWidget{
  @override
  _TabBarWidget createState() => _TabBarWidget();
}

class _TabBarWidget extends State<MyPage>{
  @override
  Widget build(BuildContext context) {
      return CupertinoTabScaffold(
          tabBar: CupertinoTabBar(
            backgroundColor: CupertinoColors.lightBackgroundGray,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.message),
                    title: Text('微信')
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.contact_phone),
                    title: Text('通讯录')
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.new_releases),
                    title: Text('发现')
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.perm_identity),
                    title: Text('我')
                ),
              ]
          ),
        tabBuilder: (context,index){
            return CupertinoTabView(
                builder:(context){
                  switch(index){
                    case 0:
                      return HomePage();
                      break;
                    case 1:
                      return ChatPage();
                      break;
                    case 2:
                      return FindPage();
                      break;
                    case 3:
                      return MePage();
                      break;
                  }
                }
            );
        },
      );




  }
}

class FindPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('发现面板'),
      ),
      child: Center(
        child: Text('发现',style: Theme.of(context).textTheme.button,),
      ),
    );

  }
}
class MePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('我的面板'),
      ),
      child: Center(
        child: Text('我的',style: Theme.of(context).textTheme.button,),
      ),
    );

  }
}
class ChatPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('聊天面板'),
      ),
      child: Center(
        child: Text('聊天',style: Theme.of(context).textTheme.button,),
      ),
    );

  }
}
class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
      return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text('主页'),
        ),
        child: Center(
          child: Text('主页',style: Theme.of(context).textTheme.button,),
        ),
      );
  }
}

