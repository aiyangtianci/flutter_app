import 'package:flutter/material.dart';

import './message_data.dart';
import './message_item.dart';

class MessagePage extends StatefulWidget {
  @override
  MessagePageState createState() {
    return new MessagePageState();
  }
}

class MessagePageState extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  ListView.builder(
          itemCount: messagedata.length,
          itemBuilder: (BuildContext context, int index) {
            return new MessageItem(messagedata[index]);
          }),
    );
  }
}
