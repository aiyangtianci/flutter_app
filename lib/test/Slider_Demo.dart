

import 'package:flutter/material.dart';

class SliderDemo extends StatefulWidget {
  @override
  _SliderDemoState createState() => _SliderDemoState();
}

class _SliderDemoState extends State<SliderDemo> {
  double _sliderItemA = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Slider'), elevation: 0.0,),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Slider( // 滑动选择器
                  value: _sliderItemA,
                  onChanged: (value) {
                    setState(() {
                      _sliderItemA = value;
                    });
                  },
                  activeColor: Colors.blue, // 进度条高亮颜色
                  inactiveColor: Colors.blue.withOpacity(0.3), // 进度条背景色
                  min: 0.0, // 设置最小值
                  max: 10.0, // 设置最大值
                  divisions: 10, // 设置分成几等份
                  label: '${_sliderItemA.toInt()}', // 进度条上面的标签
                )
              ],
            ),
            SizedBox(height: 16.0,),
            Text('SliderValue: ${_sliderItemA.toInt()}'),
          ],
        ),
      ),
    );
  }
}