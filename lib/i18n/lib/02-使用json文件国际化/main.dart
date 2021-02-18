
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:i18n_demo/i18n/localizations.dart';

import 'i18n/localizations_delegate.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demo",
//      国际化
    supportedLocales: [
      Locale("en"),
      Locale("zh"),
    ],
//      国际化值
    localizationsDelegates: [
//      正常下面三个都要写
      GlobalMaterialLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      HYLocalizationsDelegate.delegate//实现了自定义的语言(当系统切换语言时也会同步变化)
    ],
      theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: TextTheme(
              bodyText1: TextStyle(fontSize: 20)
          )
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
//        title: Text("首页"),
//      使用自己的国际化
      title: Text(HYLocalizations.of(context).title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(HYLocalizations.of(context).hello, style: Theme
                .of(context)
                .textTheme
                .bodyText1,),
            RaisedButton(
              child: Text(HYLocalizations.of(context).pickTime, style: Theme
                  .of(context)
                  .textTheme
                  .bodyText1,),
              onPressed: () {
                //时间选择器
                showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2019),
                    lastDate: DateTime(2022));
              },
            )
          ],
        ),
      ),
    );
  }
}

