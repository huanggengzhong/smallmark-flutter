
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demo",
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      RenderBox box = context.findRenderObject();
      final Shader linearGradient = LinearGradient(
        colors: <Color>[Colors.red, Colors.blue],
      ).createShader(
          Rect.fromLTWH(0.0, 0.0, box?.size?.width, box?.size?.height));
    return Scaffold(
      appBar: AppBar(
        title: Text("首页"),
      ),
      body: Container(
        child: Text(
          '老孟，专注分享Flutter技术和应用实战',
          style: new TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              foreground: Paint()..shader = linearGradient),
        )
      ),
    );
  }
}

