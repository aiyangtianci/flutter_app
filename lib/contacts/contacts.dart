import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import './contact_sider_list.dart';
import './contact_item.dart';
import './contact_header.dart';
import './contact_vo.dart';

class Contacts extends StatefulWidget {
  @override
  ContactsState createState() {
    return ContactsState();
  }
}

class ContactsState extends State<Contacts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ContactSiderList(
        //好友列表
        items: contacts,
        headerBuilder: (BuildContext context, int index) {
          //显示列表头
          return Contactheader();
        },
        itemBuilder: (BuildContext contet, int index) {
          //列表项
          return Container(
            color: Colors.white,
            alignment: Alignment.centerLeft,
            child: ContactItem(
              item: contacts[index],
            ),
          );
        },
        //字母构造器
        sectionBuilder: (BuildContext context, int index) {
          return Container(
            height: 32.0,
            padding: const EdgeInsets.only(left: 14.0),
            color: Colors.grey[300],
            alignment: Alignment.centerLeft,
            child: Text(
              contacts[index].seationKey,
              style: TextStyle(fontSize: 14.0, color: Color(0xff909090)),
            ),
          );
        },
      ),
    );
  }
}
