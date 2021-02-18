//推荐使用intl,最方便;

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
//import 'package:i18n_demo/i18n/localizations.dart';
import 'package:i18n_demo/generated/l10n.dart';
//import 'i18n/localizations_delegate.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static _AppSetting setting = _AppSetting();
  @override
  void initState() {
    super.initState();
    setting.changeLocale = (Locale locale) {
      setState(() {
        setting._locale = locale;
      });
    };
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demo",
//  使用插件国际化
    supportedLocales: S.delegate.supportedLocales,
      locale: setting._locale,
//      locale: Locale("en"),//这里改成Locale("zh")就是中文了
//      本地json文件国际化
//    supportedLocales: [
//      Locale("en"),
//      Locale("zh"),
//    ],

//      国际化值
    localizationsDelegates: [
//      正常下面三个都要写
      GlobalMaterialLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      S.delegate,//使用插件的语言
//      HYLocalizationsDelegate.delegate,//实现了自定义的语言(当系统切换语言时也会同步变化)
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

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
//        title: Text("首页"),
//      使用插件国际化
        title: Text(S.of(context).title),

//      使用自己的国际化
//      title: Text(HYLocalizations.of(context).title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(S.of(context).hello, style: Theme
                .of(context)
                .textTheme
                .bodyText1,),
            RaisedButton(
              child: Text(S.of(context).pickTime, style: Theme
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
            ),
            Text(S.of(context).message("get canshu haha")),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  child: Text("切换中文"),
                  onPressed: (){
                    _MyAppState.setting.changeLocale(Locale('zh'));
                  },
                ),   RaisedButton(
                  child: Text("切换英文"),
                  onPressed: (){
                    _MyAppState.setting.changeLocale(Locale('en'));
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
//切换参考的是http://laomengit.com/guide/intl/%E5%BA%94%E7%94%A8%E7%A8%8B%E5%BA%8F%E5%86%85%E5%88%87%E6%8D%A2%E8%AF%AD%E8%A8%80.html
class _AppSetting {
  _AppSetting();

  Null Function(Locale locale) changeLocale;
  Locale _locale;
}

