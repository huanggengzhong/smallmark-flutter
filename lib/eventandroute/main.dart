import 'package:flutter/material.dart';
import 'package:event_bus/event_bus.dart';
main() {
  return runApp(MyApp());
}

// 跨组件事件传递方法
class UserInfo{
  String name;
  int age;
  UserInfo(this.name,this.age);

}


final eventBus=EventBus();






class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text("事件传递"),
            ),
            body: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[ButtonWidget(), TextWidget()],
            ))));
  }
}

class ButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text("我是事件源"),
      onPressed: () {
        final user=UserInfo("gengzhong",18);
        eventBus.fire(user);
      },
    );
  }
}

class TextWidget extends StatefulWidget {
  @override
  _TextWidgetState createState() => _TextWidgetState();
}

class _TextWidgetState extends State<TextWidget> {
  String message="hello";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//    这里监听事件
  eventBus.on<UserInfo>().listen((data) {
    setState(() {
      message="${data.name},${data.age}";
    });
  });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("我是别的组件:$message"),
    );
  }
}
