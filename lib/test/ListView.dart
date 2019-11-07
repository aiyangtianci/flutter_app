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
      home: new StepperDemo(),
    );
  }
}

//步骤列表
class StepperDemo extends StatefulWidget {
  @override
  _StepperState createState() => _StepperState();
}

class _StepperState extends State<StepperDemo> {
  int _currentStepIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('stepper'),
      ),
      body: Container(
        padding: EdgeInsets.all(15.0),
        child: ListView(
          children: <Widget>[
            Stepper(
              onStepTapped: (int index){
                setState(() {
                  _currentStepIndex =index;
                });
              },
              onStepContinue: (){
                setState(() {
                  _currentStepIndex<2?_currentStepIndex++:_currentStepIndex=0;

                });
              },
              onStepCancel: (){
                setState(() {
                  _currentStepIndex>0?_currentStepIndex--:_currentStepIndex=2;
                });
              },
              currentStep: _currentStepIndex,
              steps: [
                Step(
                  title: Text(messagedata[0].title),
                  subtitle: Text(messagedata[0].title),
                  content: Text(messagedata[0].subTitle),
                  isActive: _currentStepIndex == 0,
                ),
                Step(
                  title: Text(messagedata[1].title),
                  subtitle: Text(messagedata[1].title),
                  content: Text(messagedata[1].subTitle),
                  isActive: _currentStepIndex == 1,
                ),
                Step(
                  title: Text(messagedata[2].title),
                  subtitle: Text(messagedata[2].title),
                  content: Text(messagedata[2].subTitle),
                  isActive: _currentStepIndex == 2,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

//DataTable 分页
class PostDataSource extends DataTableSource {
  var selectCount = 0;

  @override
  // TODO: implement rowCount
  int get rowCount => messagedata.length;

  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => selectCount;

  @override
  DataRow getRow(int index) {
    // TODO: implement getRow
    return DataRow.byIndex(cells: <DataCell>[
      DataCell(
        Text(messagedata[index].title),
      ),
      DataCell(Container(
        width: 80,
        height: 100,
        child: Text(
          messagedata[index].subTitle,
          maxLines: 5,
        ),
      )),
      DataCell(
        Image.network(
          messagedata[index].avatar,
          fit: BoxFit.cover,
        ),
      )
    ], index: index);
  }
}

class _DatatableState extends State<DataTableDemo> {
  int _sortColumnIndex;
  bool _sortAscending = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('dataTable'),
      ),
      body: ListView(
        children: <Widget>[
          PaginatedDataTable(
            header: Text('标题'),
            rowsPerPage: 8,
            source: PostDataSource(),
            sortAscending: _sortAscending,
            sortColumnIndex: _sortColumnIndex,
            columns: [
              DataColumn(
                label: Text('Title'),
              ),
              DataColumn(
                label: Text('subTitle'),
              ),
              DataColumn(label: Text('Image')),
            ],
//选择框
//            rows: messagedata.map((data) {
//              return DataRow(
//                selected: data.selected,
//                onSelectChanged: (bool selected){
//                  setState(() {
//                    data.selected!=selected?data.selected =selected:data.selected =data.selected;
//                  });
//                },
//                cells: [
//                  DataCell(
//                    Text(data.title),
//                  ),
//                  DataCell(Container(
//                    width: 80,
//                    height: 100,
//                    child: Text(
//                      data.subTitle,
//                      maxLines: 5,
//                    ),
//                  )),
//                  DataCell(
//                    Image.network(
//                      data.avatar,
//                      fit: BoxFit.cover,
//                    ),
//                  )
//                ],
//              );
//            }).toList(),
          ),
        ],
      ),
    );
  }
}

//数据表格
class DataTableDemo extends StatefulWidget {
  @override
  _DatatableState createState() => _DatatableState();
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
                      blurRadius: 10.0),
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
            title: Text(
              '展览馆',
              style: TextStyle(
                backgroundColor: Colors.blue,
              ),
            ),
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
              padding: EdgeInsets.only(
                left: 20.0,
                right: 20.0,
              ),
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
//                '''
//                千百年来，九寨沟隐藏在川西北高原的崇山峻岭中，人类的活动显得微不足道。本区藏民几乎与世隔绝，过着自给自足的农牧生活。由于山高路远，九寨沟一向鲜为人知。
//1975年，国家农林渔业部的一个工作组对九寨沟进行了综合考察，并得出了"九寨沟不仅蕴藏了丰富、珍贵的动植资源，也是世界上少有的优美风景区"的结论。同年著名林学家吴中伦教授对九寨沟进行了较为全面的考察。他身临其境，感慨万千："我曾到过欧美数国，也未见到有这样奇美的自然景色，必须很好保护起来"，他立即告知省林业厅并上书四川省政府。省林业厅立即行文南坪县林业局："九寨沟则查洼、日则沟两百米以外才能砍伐"。这是林业部门保护九寨沟的最早措施。
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
