import 'package:flutter/material.dart';
import './chat/message_page.dart';
import './contacts/contacts.dart';
import './personal/personal.dart';

class MyAPP extends StatefulWidget {
  @override
  AppState createState() {
    return AppState();
  }
}

class AppState extends State<MyAPP> {
  var _currentIndex = 0;

  // 聊天页面
  MessagePage message;

//  //好友页面
  Contacts contacts;

//
  //我的页面
  Personal me;

  //根据当前索引返回页面
  currentPage() {
    switch (_currentIndex) {
      case 0:
        if (message == null) {
          message = new MessagePage();
        }
        return message;
      case 1:
        if (contacts == null) {
          contacts = new Contacts();
        }
        return contacts;

      case 2:
        if (me == null) {
          me = new Personal();
        }
        return me;
      default:
    }
  }

  //渲染某个菜单项，传入菜单标题，图片路径或图标
  _popupMenuItem(String title, {String imagePath, IconData icon}) {
    return PopupMenuItem(
      child: Row(
        children: <Widget>[
          imagePath != null
              ? Image.asset(
                  imagePath,
                  width: 32.0,
                  height: 32.0,
                )
              : SizedBox(
                  width: 32.0,
                  height: 32.0,
                  child: Icon(
                    icon,
                    color: Colors.white,
                  ),
                ),
          Container(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              title,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QQ聊天'),
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              print('查找。。。');
              Navigator.pushNamed(context, 'search');
            },
            child: Icon(Icons.search),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0, right: 20.0),
            child: GestureDetector(
              onTap: () {
                showMenu(
                  context: context,
                  position: RelativeRect.fromLTRB(500.0, 76.0, 10.0, 0.0),
                  items: <PopupMenuEntry>[
                    _popupMenuItem('发起会话', icon: Icons.people),
                    _popupMenuItem('添加好友', icon: Icons.person_add),
                    _popupMenuItem('联系客服', icon: Icons.person),
                  ],
                );
              },
              //菜单按钮
              child: Icon(Icons.more_horiz),
            ),
          ),
        ],
      ),
      bottomNavigationBar: new BottomNavigationBar(
        //通过fixedColor 设置选中的item 颜色
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        //按下设置当前页面索引
        onTap: ((index) {
          print(_currentIndex);
          setState(() {
            _currentIndex = index;
          });
        }),
        items: [
          //导航按钮项传入文本及图标
          new BottomNavigationBarItem(
            title: new Text(
              '聊天',
              style: TextStyle(
                color: _currentIndex == 0 ? Colors.blue : Color(0xff999999),
              ),
            ),
            icon: _currentIndex == 0
                ? Image.asset(
                    'images/icon_message_fill.png',
                    width: 32.0,
                    height: 28.0,
                  )
                : Image.asset(
                    'images/icon_message.png',
                    width: 32.0,
                    height: 28.0,
                  ),
          ),
          new BottomNavigationBarItem(
            title: new Text(
              '好友',
              style: TextStyle(
                color: _currentIndex == 1 ? Colors.blue : Color(0xff999999),
              ),
            ),
            icon: _currentIndex == 1
                ? Image.asset(
                    'images/icon_addresslist_fil.png',
                    width: 32.0,
                    height: 28.0,
                  )
                : Image.asset(
                    'images/icon_addresslist.png',
                    width: 32.0,
                    height: 28.0,
                  ),
          ),
          new BottomNavigationBarItem(
            title: new Text(
              '我的',
              style: TextStyle(
                color: _currentIndex == 2 ? Colors.blue : Color(0xff999999),
              ),
            ),
            icon: _currentIndex == 2
                ? Image.asset(
                    'images/icon_signal_fill.png',
                    width: 32.0,
                    height: 28.0,
                  )
                : Image.asset(
                    'images/icon_signal.png',
                    width: 32.0,
                    height: 28.0,
                  ),
          ),
        ],
      ),
      body: currentPage(),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountEmail: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/friends');
                },
                child: Text('https://blog.csdn.net/csdn_aiyang'),
              ),
              accountName: Text(
                '艾阳',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://avatar.csdnimg.cn/F/D/2/3_csdn_aiyang.jpg'),
              ),
              decoration: BoxDecoration(
                color: Color(0x1F000000),
                image: DecorationImage(
                  image: AssetImage('images/welcome.jpeg'),
                  fit: BoxFit.cover,
                  //颜色过滤
                  colorFilter: ColorFilter.mode(Color(0xff29B6F6), BlendMode.darken),
                ),
              ),
            ),
            ListTile(
              title: Text(
                'Message',
                textAlign: TextAlign.center,
              ),
              trailing: Icon(
                Icons.message,
                color: Colors.black,
                size: 22,
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/friends');
              },
            ),
            ListTile(
              title: Text(
                'Favorite',
                textAlign: TextAlign.center,
              ),
              trailing: Icon(
                Icons.favorite,
                color: Colors.black,
                size: 22,
              ),
              onTap: () {
                Navigator.pushNamed(context, '/friends');
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text(
                'Settins',
                textAlign: TextAlign.center,
              ),
              trailing: Icon(
                Icons.settings,
                color: Colors.black,
                size: 22,
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/friends');
              },
            ),
          ],
        ),
      ),
    );
  }
}
