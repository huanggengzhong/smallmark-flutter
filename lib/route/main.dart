import 'about.dart';
import 'package:flutter/material.dart';
import 'detail.dart';

main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    initialRoute: "/",
//      使用路由映射表
        routes: {
          "/": (ctx) => HomePage(),
          "/about": (ctx) => AboutPage()},

    );

//        home: HomePage());
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
          title: Text("首页"),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[ButtonWidget(), ButtonDetail()],
        )));
  }
}

class ButtonWidget extends StatelessWidget {
  void _jumpToDetail(BuildContext context) {
    Future result =
        Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
      return DetailScreen("这是首页的数据");
    }));

//  在返回的回调里渲染详情传递的信息
    result.then((res) {
      print("收到详情页的数据啦:$res");
    });
  }

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text("跳转详情页"),
      onPressed: () => _jumpToDetail(context),
    );
  }
}

//关于页面,使用命名路由方式跳转
class ButtonDetail extends StatelessWidget {
  void _jumpToAbout(BuildContext context) {
    Navigator.of(context).pushNamed("/about");
  }

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text("跳转关于页"),
      onPressed: () => _jumpToAbout(context),
    );
  }
}
