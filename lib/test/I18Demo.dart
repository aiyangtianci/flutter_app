import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'I18',
      home: Scaffold(
        appBar: AppBar(
          title: Text('I18'),
        ),
        body: MyI18NDemo(),
      ),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate, //提供应用里面material组件的本地化的字符串
        GlobalWidgetsLocalizations.delegate, //提供定义默认的小控件文字的阅读方向，根据用户设置切换
      ],
      //支持的语言
      supportedLocales: [
        Locale('en', 'US'),
        Locale('zh', 'CN'),
      ],
      //设置当前应用语言
//      locale: Locale('en', 'US'),
      //方法设置当前语言
      localeResolutionCallback: (Locale locale, Iterable<Locale> supportedLocales){
        return Locale('en', 'US');
      },
    ),
  );
}

class MyI18NDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Locale locale = Localizations.localeOf(context);
    return Center(
      child: Text('locale:${locale.toString()}'),
    );
  }
}
