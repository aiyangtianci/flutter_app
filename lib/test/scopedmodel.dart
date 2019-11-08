import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

void main() {
  runApp(new MaterialApp(
    title: 'scopedmodel',
    home: MyScropedApp(),
  ));
}

class MyScropedApp extends StatelessWidget {
  int _count = 0;

  void inCreaseCount() {
    _count++;
    print(_count);
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: CounterModel(),
//      count: _count,
//      voidCallback: inCreaseCount,
      child: Scaffold(
        appBar: AppBar(
          title: Text('scopedmodel'),
        ),
        body: CounterWrapper(),
        floatingActionButton: ScopedModelDescendant<CounterModel>(
          rebuildOnChange: false,
          builder: (context, _, model) => FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                model.increaseCount();
              }),
        ),
      ),
    );
  }
}

class CounterWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    final int count = CounterProvider.of(context).count;
//    final VoidCallback inCreaseCount = CounterProvider.of(context).voidCallback;
    return Center(
      child: ScopedModelDescendant<CounterModel>(
        builder:(context,_,model)=> ActionChip(
            label: Text('${model.count}'),
            onPressed: () {
              model.increaseCount();
            }),
      ),
    );
  }
}
/**
 * 第三方库  scoped动态
 */
class CounterModel extends Model {
  int _count = 0;

  int get count => _count;

  void increaseCount() {
    _count++;
    notifyListeners();
  }
}

/**
 * 继承传递
 */
class CounterProvider extends InheritedWidget {
  final int count;
  final VoidCallback voidCallback;
  final Widget child;

  CounterProvider({this.count, this.voidCallback, this.child})
      : super(child: child);

  static CounterProvider of(BuildContext context) =>
      context.inheritFromWidgetOfExactType(CounterProvider);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }
}
