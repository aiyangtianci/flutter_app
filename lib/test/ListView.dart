import 'package:flutter/material.dart';
import 'package:flutter_app/chat/message_data.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '列表',
      theme: ThemeData(primarySwatch: Colors.blue),
//      home: new GrideView(),
      home: new SliverView(),
    );
  }
}

/**
 * 裂口，一小块可视口
 */
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

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text('展览馆',style: TextStyle(backgroundColor: Colors.blue,),),
            pinned: true,
            floating: true,
            expandedHeight: 150.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'Look'.toUpperCase(),
                style: TextStyle(
                  fontSize: 13.0,
                  letterSpacing: 15.0,
                  backgroundColor: Colors.blue,
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

class GrideView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget _buideGridview() {
      return new GridView.extent(
        maxCrossAxisExtent: 150.0,
        //限定宽度
        padding: const EdgeInsets.all(4.0),
        mainAxisSpacing: 4.0,
        //主轴间隙
        crossAxisSpacing: 4.0,
        //穿轴间隙
        children: List<Container>.generate(5,
            (int index) => new Container(child: Image.asset('images/1.png'))),
      );
    }

    return new Scaffold(
        appBar: AppBar(
          title: Text('gridview'),
        ),
        body: new Center(
          child: _buideGridview(),
        )
        /**
       * new GridView.count(
          primary: false,
          crossAxisSpacing: 10.0,
          crossAxisCount: 3,
          children: <Widget>[
          Text('aaa'),
          Text('aaa'),
          Text('aaa'),
          Text('aaa'),
          Text('aaa'),
          Text('aaa'),
          Text('aaa'),
          Text('aaa'),],
          ),
       */
        );
  }
}

/**
 * 滑动列表
 */
class ListviewWidget extends StatelessWidget {
  final List<String> items = new List<String>.generate(20, (i) => '富华大厦第 $i号楼');

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('listview'),
      ),
      body:
//        new ListView(
//          children: <Widget>[
//            new Center(
//              child: new Text(
//                '九寨沟',
//                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
//              ),
//            ),
//            new Center(
//              child: new Text(
//                '历史沿革',
//                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
//              ),
//            ),
//            new Center(
//              child: new Text(
//                '''
//                千百年来，九寨沟隐藏在川西北高原的崇山峻岭中，人类的活动显得微不足道。本区藏民几乎与世隔绝，过着自给自足的农牧生活。由于山高路远，九寨沟一向鲜为人知。
//1975年，国家农林渔业部的一个工作组对九寨沟进行了综合考察，并得出了"九寨沟不仅蕴藏了丰富、珍贵的动植资源，也是世界上少有的优美风景区"的结论。同年著名林学家吴中伦教授对九寨沟进行了较为全面的考察。他身临其境，感慨万千："我曾到过欧美数国，也未见到有这样奇美的自然景色，必须很好保护起来"，他立即告知省林业厅并上书四川省政府。省林业厅立即行文南坪县林业局："九寨沟则查洼、日则沟两百米以外才能砍伐"。这是林业部门保护九寨沟的最早措施。
//1977年，四川省珍稀动物资源调查队，写出了《四川省珍稀动物资源调查报告》，建议将南坪县白河自然保护区扩建至九寨沟区域内。
//1978年8月，中科院成都生物研究所提出了在九寨沟建立自然保护区的必要性，引起了四川省委的高度重视。11月30日，有关部门下令停止在九寨沟采伐木材。1978年12月15日，国务院以国发（1978）256号文件批准国家林业总局"关于加强大熊猫保护、驯养工作的报告"，批准建立南坪县九寨沟自然保护区管理所。1978年国务院国发（1978）34号文件规定将九寨沟划为自然风景保护区，保护区面积为620平方公里。
//1979年，进驻九寨沟的两个林场迁出。同年，根据四川省革命委员会"关于加强自然保护区建设的通知"（川革发[1979]36号）文件精神，成立四川省南坪县九寨沟自然保护区管理所。
//1987年1月20日，中华人民共和国城乡建设保护部（87）24号文批准了九寨沟总体规划，风景区范围为720平方公里，外围保护地带为600平方公里。九寨沟的建设从此走上了正轨。
//1989年，建立九寨沟镇，形成管理处、管理局、镇政府三块牌子、一套班子统一管理九寨沟。同年4月20日，九寨沟风景名胜区管理局加入中国风景名胜区协会。
//1992年12月14日，九寨沟经联合国教科文组织世界遗产委员会16届会议批准被列入《世界自然遗产名录》，从而成为具有世界意义和突出价值而需要全世界共同承担保护责任的自然遗产地。
//1993年，形成管理处、管理局两块牌子、一套班子的管理体制。
//1994年7月，林业部以林函护字（1994）174号文确认九寨沟为国家级自然保护区，旨在保护大熊猫、金丝猴等珍稀动物及其自然生态环境。
//1995年9月14日，九寨沟加入了中国人与生物圈保护区网络，并列入世界人与生物圈保护区推荐名录。
//1997年10月29日，九寨沟加入世界生物圈保护区网络，成为联合国教科文组织发起的关于人与环境关系全球性科学计划的内容之一。
//1998年5月26日，联合国教科文组织和中科院为九寨沟自然保护区颁发了"世界生物圈保护区"证书。同年11月7日，成立了以州、县领导为主的九寨沟管理委员会。
//2000年3月，根据国家林业局林护发（2000）131号文要求，"九寨沟国家级自然保护区管理处"更名为"九寨沟国家级自然保护区管理局"。同年10月，升格为州政府直属的正县级事业单位，实行"以州为主，州县共管"的管理体制。
//2001年2月12日，九寨沟通过"绿色环球'21"初步认证。绿色环球组织亚洲总部设在澳大利亚，吸收在环境保护和生态旅游方面有突出成绩的旅游目的地和旅游企业加入该组织，并作为最佳旅游目的地和最佳旅游企业向全世界的旅游者推荐。2002年6月20日，专家组对九寨沟进行了正式评审。
//                ''',
//                style: TextStyle(fontSize: 16.0),
//              ),
//            ),
//          ],
//        )
          ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                if (index % 3 == 0) {
                  return new ListTile(
                    leading: Icon(
                      Icons.directions_bus,
                      color: Colors.green,
                    ),
                    title: Text('${items[index]}'),
                    subtitle: Text('北京市东城区建国路192国道分区公交站'),
                  );
                } else if (index % 3 == 1) {
                  return new ListTile(
                    leading: Icon(Icons.directions_car,
                        color: Colors.lightBlueAccent),
                    title: Text('${items[index]}'),
                    subtitle: Text('北京市顺义区京密路122国道分区出租车站'),
                  );
                } else {
                  return new ListTile(
                    leading:
                        Icon(Icons.directions_transit, color: Colors.amber),
                    title: Text('${items[index]}'),
                    subtitle: Text('北京市朝阳区海淀五路楼下的8路地铁站'),
                  );
                }
              }),
    );
  }
}
