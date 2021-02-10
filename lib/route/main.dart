import 'unkownPage.dart';
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
      initialRoute: HomePage.routeName,

//      使用路由映射表
      routes: {
        HomePage.routeName: (ctx) => HomePage(),
        AboutPage.routeName: (ctx) => AboutPage(),
//      "/detail":(ctx)=>DetailScreen()//如果用命名路由时这里是添加不了参数的
      },
//      这里解决命名路由参数问题
      onGenerateRoute: (settings) {
        if (settings.name == "/detail") {
          return MaterialPageRoute(builder: (ctx) {
            return DetailScreen(settings.arguments);
          });
        }
        return null;
      },
      onUnknownRoute: (settings){
        return MaterialPageRoute(
          builder: (ctx){
            return UnkownPage();
          }
        );
      },
    );

//        home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  static const String routeName = "/";

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
          children: <Widget>[
            ButtonWidget(),
            ButtonDetail(),
            RaisedButton(
              child: Text("命名方式打开详情页(带参数)"),
              onPressed: () {
                Navigator.of(context)
                    .pushNamed('/detail', arguments: "这是首页传递的参数");
              },
            ),
            RaisedButton(
              child: Text("测试错误页面"),
              onPressed: () {
                Navigator.of(context)
                    .pushNamed('/adfsadf');
              },
            ),
          ],
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
    Navigator.of(context).pushNamed("/about", arguments: "首页的数据");
  }

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text("跳转关于页"),
      onPressed: () => _jumpToAbout(context),
    );
  }
}

//使用命名路由方式跳转详情并携带参数
class ButtonDetail2 extends StatelessWidget {
  void _jumpToDetail(BuildContext context) {
    Navigator.of(context).pushNamed("/detail", arguments: "首页的数据");
  }

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text("跳转详情页"),
      onPressed: () => _jumpToDetail(context),
    );
  }
}
