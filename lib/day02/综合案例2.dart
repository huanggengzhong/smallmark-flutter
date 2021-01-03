
import 'package:flutter/material.dart';

main()=>  runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text('计数器案例') ,
      ),
      body: ContentPage("父组件HomePage传递过来的信息"),
    );
  }
}

class ContentPage extends StatefulWidget {
//  接收父组件传递过来的信息
  final String message;
  ContentPage(this.message);
  @override
  _ContentPageState createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage> {


  int count =0;
  @override
  Widget build(BuildContext context) {
    //  在state里使用StatefulWidget的数据方法,State内部有一个widget属性可以获取StatefulWidgee
    print(widget.message);
    return Center(
      child: Column(
        mainAxisAlignment:MainAxisAlignment.center,
        children: <Widget>[
          _getButtons(),
          Text("当前计数:$count"),
          Text("得到:${widget.message}")
        ],
      ),
    );
  }

  _getButtons(){
    return Row(
      mainAxisAlignment:MainAxisAlignment.center,
      children: <Widget>[
        RaisedButton(
          child: Text('+',style: TextStyle(color:Colors.white),),
          color:Colors.pink,
          onPressed: (){
            setState(() {
              count++;
            });
          },
        ),
        RaisedButton(
          child: Text('-',style:TextStyle(color:Colors.white)),
          color:Colors.purple,
          onPressed: (){
            if(count>0){
              setState(() {
                count--;
              });
            }
          },
        ),
      ],
    );
  }
}

