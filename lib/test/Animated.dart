import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: _MyHomePageState(),
    );
  }
}

class _MyHomePageState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Opacity'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return OpacityApp();
                  }));
                },
                child: Text('显示隐藏')),
            SizedBox(
              height: 30.0,
            ),
            FlatButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return AnimControllerDemo();
                  }));
                },
                child: Text('控制器')),
          ],
        ),
      ),
    );
  }
}

/**
 * 显示隐藏
 */
class AnimControllerDemo extends StatefulWidget {
  @override
  _AnimControllerState createState() => _AnimControllerState();
}

class _AnimControllerState extends State<AnimControllerDemo> //钟表混合
    with
        TickerProviderStateMixin {
  AnimationController _animationController;
  Animation _animation;
  Animation _animationColor;
  CurvedAnimation _curvedAnimation; //曲线

  @override
  void initState() {
    super.initState();
    //vsync 防止屏幕外的动画消耗不必要资源
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
//        value: 23,
//        lowerBound: 10,
//        upperBound: 100
    );

    //监听
    _animationController.addListener(() {
      setState(() {});
    });
    _animationController.addStatusListener((AnimationStatus status) {
      print(status);
    });

    _curvedAnimation =
        CurvedAnimation(parent: _animationController, curve: Curves.bounceOut);
    //大小中间值
    _animation = Tween(begin: 32.0, end: 100.0).animate(_curvedAnimation);
    //颜色
    _animationColor = ColorTween(begin: Colors.red[50], end: Colors.red[400])
        .animate(_curvedAnimation);
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('animation'),
      ),
      body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ActionChip(
                  label: Text("${_animationController.value}"),
                  onPressed: () {
                    _animationController.forward();
                  }),
              SizedBox(
                height: 50.0,
              ),
              _AnimatedHeart(
                  [_animation, _animationColor], _animationController),
            ],
          )),
    );
  }
}

/**
 * 动画集合
 */
class _AnimatedHeart extends AnimatedWidget {
  final List _animations;
  final AnimationController _controller;

  _AnimatedHeart(this._animations, this._controller)
      : super(listenable: _controller);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.favorite,
      ),
      color: _animations[1].value,
      iconSize: _animations[0].value,
      onPressed: () {
        _controller.forward();
        switch (_controller.status) {
          case AnimationStatus.completed:
            _controller.reverse();
            break;
          case AnimationStatus.dismissed:
            _controller.forward();
            break;
          case AnimationStatus.forward:
            // TODO: Handle this case.
            break;
          case AnimationStatus.reverse:
            // TODO: Handle this case.
            break;
        }
      },
    );
  }
}

/**
 * 显示隐藏
 */
class OpacityApp extends StatefulWidget {
  @override
  _AnimatedOpacityDemo createState() => _AnimatedOpacityDemo();
}

class _AnimatedOpacityDemo extends State<OpacityApp> {
  bool _visible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Opacity'),
      ),
      body: Center(
        child: AnimatedOpacity(
          opacity: _visible ? 1.0 : 0.0,
          duration: Duration(milliseconds: 1000),
          child: Container(
            width: 300.0,
            height: 300.0,
            color: Colors.deepPurple,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _visible = !_visible;
          });
        },
        tooltip: '显示隐藏',
        child: new Icon(Icons.flip),
      ),
    );
  }
}
