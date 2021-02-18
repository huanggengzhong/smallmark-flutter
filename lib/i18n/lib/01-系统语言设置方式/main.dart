import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

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
        GlobalWidgetsLocalizations.delegate
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
        title: Text("首页"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("你好", style: Theme
                .of(context)
                .textTheme
                .bodyText1,),
            RaisedButton(
              child: Text("请选择一个时间", style: Theme
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

