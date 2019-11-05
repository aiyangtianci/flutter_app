import 'package:flutter/material.dart';

void main() {
  runApp(didiHome());
//  runApp(HomePage());
}

/**
 * Tab切换
 */

class didiHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: '滴滴出行',
        home: new DefaultTabController(
          length: choices.length,
          child: new Scaffold(
            appBar: new AppBar(
              title: Text('滴滴出行'),
              bottom: new TabBar(
                  tabs: choices.map((Choice c) {
                return new Tab(
                  text: c.title,
                  icon: Icon(c.icon),
                );
              }).toList()),
            ),
            body: new TabBarView(
                children: choices.map((Choice cc) {
              return new Padding(
                padding: EdgeInsets.all(16.0),
                child: new ChildPage(choice: cc),
              );
            }).toList()),
            bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                fixedColor: Colors.yellow,
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.message), title: Text('微信')),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.contact_phone), title: Text('通讯录')),
                ]),
          ),
        ));
  }
}

class HomePage extends StatefulWidget {
  @override
  _didiSimpleState createState() => _didiSimpleState();
}

/**
 * PopupMenuButton
 */
class _didiSimpleState extends State<HomePage> {
  Choice _selectChoice = choices[0];

  void _select(Choice choice) {
    setState(() {
      _selectChoice = choice;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '滴滴出行',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('滴滴出行'),
          actions: <Widget>[
            IconButton(
              icon: Icon(choices[0].icon),
              onPressed: () {
                _select(choices[0]);
              },
            ),
            IconButton(
              icon: Icon(choices[1].icon),
              onPressed: () {
                _select(choices[1]);
              },
            ),
            PopupMenuButton<Choice>(
              onSelected: _select,
              itemBuilder: (BuildContext context) {
                return choices.skip(2).map<PopupMenuItem<Choice>>((Choice c) {
                  return PopupMenuItem<Choice>(
                    value: c,
                    child: Text(c.title),
                  );
                }).toList();
              },
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ChildPage(choice: _selectChoice),
        ),
      ),
    );
  }
}

class ChildPage extends StatelessWidget {
  final Choice choice;

  ChildPage({Key key, this.choice}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle styles = Theme.of(context).textTheme.display1;
    return Card(
        color: Colors.white,
        child: new Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                choice.icon,
                size: 128.0,
                color: styles.color,
              ),
              Text(
                choice.title,
                style: styles,
              )
            ],
          ),
        ));
  }
}

class Choice {
  final String title;

  const Choice({this.title, this.icon});

  final IconData icon;
}

const List<Choice> choices = <Choice>[
  Choice(title: '自驾', icon: Icons.directions_car),
  Choice(title: '自行车', icon: Icons.directions_bike),
  Choice(title: '乘船', icon: Icons.directions_boat),
  Choice(title: '公交车', icon: Icons.directions_bus),
  Choice(title: '火车', icon: Icons.directions_transit),
  Choice(title: '步行', icon: Icons.directions_walk),
  Choice(title: '乘船', icon: Icons.directions_boat),
  Choice(title: '公交车', icon: Icons.directions_bus),
  Choice(title: '火车', icon: Icons.directions_transit),
  Choice(title: '步行', icon: Icons.directions_walk),
];
