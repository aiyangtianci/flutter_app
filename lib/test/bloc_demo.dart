import 'dart:async';

import 'package:flutter/material.dart';

/**
 * bloc = Business Logic Component  业务逻辑组件
 */
void main() {
  runApp(
    MaterialApp(
      title: 'bloc',
      home: CounterProvider(
        bloc: BlocCounter(),
        child: Scaffold(
          appBar: AppBar(
            title: Text('bloc训练'),
          ),
          body: BlocDemo(),
          floatingActionButton: CounterActionButton(),
        ),
      ),
    ),
  );
}

class CounterProvider extends InheritedWidget {
  //继承部件
  final Widget child;
  final BlocCounter bloc;

  CounterProvider({this.child, this.bloc}) : super(child: child);

  static CounterProvider of(BuildContext context) =>
      context.inheritFromWidgetOfExactType(CounterProvider);

  @override
  bool updateShouldNotify(CounterProvider oldWidget) {
    return true;
  }
}

class BlocCounter {
  final  _streamController  = StreamController<int>();
  StreamSink<int> get counter => _streamController.sink;


  BlocCounter(){
    this._streamController.stream.listen(onData);
  }
  void onData(int data){
    print('$data');
  }

  void log() {
    print('Bloc');
  }
}

class CounterActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BlocCounter _bloc = CounterProvider.of(context).bloc;
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {
        _bloc.counter.add(1);
        _bloc.log();
      },
    );
  }
}

class BlocDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BlocCounter _bloc = CounterProvider.of(context).bloc;
    return Center(
      child: ActionChip(
        label: Text('0'),
        onPressed: () {
          _bloc.counter.add(1);
          _bloc.log();
        },
      ),
    );
  }
}
