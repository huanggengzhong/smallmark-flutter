import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('布局组件'),
      ),

//      body:AlignDemo()
//        body:CenterDemo()
      body: HYHomeContent(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => print("点击了244333"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

//单子组件布局
class HYHomeContent extends StatefulWidget {
  @override
  _HYHomeContentState createState() => _HYHomeContentState();
}

class _HYHomeContentState extends State<HYHomeContent> {
  @override
  Widget build(BuildContext context) {
    return Container(
//      color: Colors.red,
      width: 200,
      height: 200,
      alignment: Alignment(0, 0),
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(10),
      child: Text("Hello World2"),
//      transform: Matrix4.rotationZ(50),
      decoration: BoxDecoration(
          color: Colors.red,
          border: Border.all(width: 5, color: Colors.purple),
//        borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(
                color: Colors.orange,
                offset: Offset(10, 10),
                spreadRadius: 5,
                blurRadius: 10),
            BoxShadow(
                color: Colors.blue,
                offset: Offset(-10, 10),
                spreadRadius: 5,
                blurRadius: 10),
          ]),
    );
  }
}
