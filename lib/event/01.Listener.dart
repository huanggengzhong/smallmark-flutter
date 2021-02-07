import 'package:flutter/material.dart';

main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home:Scaffold(
          appBar: AppBar(
            title: Text("事件监听"),
          ),
          body: Center(
//          Listener原生事件的使用
            child: Listener(
                onPointerDown: (event) {
                  print("事件开始:${event.position}");
                },
                child: Container(
                  width: 200,
                  height: 200,
                  color: Colors.red,
                )),
          ),
        )
    );
  }
}
