
import 'package:flutter/material.dart';
import 'package:flutter_app/chat/message_data.dart';


class SliverView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget SliverGridView() {
      return SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20.0,
            mainAxisSpacing: 20.0,
            //item宽高比例
            childAspectRatio: 1.1),
        delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.grey[400],
                      spreadRadius: 2.0,
                      blurRadius: 10.0
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.network(
                  messagedata[index].avatar,
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
          childCount: messagedata.length,
        ),
      );
    }

    Widget SliverListView() {
      return SliverList(
        delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.only(bottom: 30.0),
            child: Material(
              color: Colors.transparent,
              elevation: 14.0,
              shadowColor: Colors.grey.withOpacity(0.5),
              child: Stack(
                children: <Widget>[
                  AspectRatio(
                    aspectRatio: 16 / 9,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: Image.network(
                        messagedata[index].avatar,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 32.0,
                    left: 32.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          messagedata[index].title,
                          style: TextStyle(
                              color: Colors.yellow,
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          messagedata[index].subTitle,
                          style: TextStyle(color: Colors.grey, fontSize: 14.0),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        }, childCount: messagedata.length),
      );
    }

    return

      Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text('展览馆'),
            pinned: true,
            floating: true,
            expandedHeight: 150.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'Look'.toUpperCase(),
                style: TextStyle(
                  fontSize: 13.0,
                  letterSpacing: 15.0,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.right,
              ),
              background: Image.asset(
                'images/welcome.jpeg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverSafeArea(
            sliver: SliverPadding(
              padding: EdgeInsets.only(left:20.0,right: 20.0,),
              sliver: SliverGridView(),
            ),
          ),
          SliverSafeArea(
            sliver: SliverPadding(
              padding: EdgeInsets.all(25.0),
              sliver: SliverListView(),
            ),
          ),
        ],
      ),
    );
  }
}
