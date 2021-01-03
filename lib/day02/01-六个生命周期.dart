

import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HYHomePage("哈哈"),
    );
  }
}

class HYHomePage extends StatelessWidget {
  final String message;
  HYHomePage(this.message){
//    print("构造函数声明周期");
  }

  @override
  Widget build(BuildContext context) {
//    print("build声明周期");
    return Scaffold(
      appBar: AppBar(
        title: Text("商品列表"),
      ),
      body: HYHomeContent(),
    );
  }
}


// Widget是不加_: 暴露给别人使用
class HYHomeContent extends StatefulWidget {

  HYHomeContent(){
    print('第1个生命周期:StatefulWidget构造函数(继承自StatefulWidget的HYHomeContent组件)');
  }

  @override
  State<StatefulWidget> createState() {
    print('第2个生命周期函数:createState方法(继承自StatefulWidget的HYHomeContent组件)');
    return _HYHomeContentState();
  }
}

// State是加_: 状态这个类只是给Widget使用
class _HYHomeContentState extends State<HYHomeContent> {
  _HYHomeContentState(){
    print('第3个生命周期函数:_HYHomeContentState构造函数(继承自State的_HYHomeContentState组件)');
  }
  int _counter = 0;
//  常用生命周期
  @override
  void initState() {
    // 强调:这里必须调用super,因为在State源码中有一个  @mustCallSuper注解,已便父组件初始化,不调会报错
    super.initState();

    print('第4个生命周期函数:initState方法(继承自State的_HYHomeContentState组件)');
  }



  @override
  Widget build(BuildContext context) {
    print('第5个生命周期函数:build方法(继承自State的_HYHomeContentState组件)');
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _getButtons(),
          Text("当前计数:$_counter", style: TextStyle(fontSize: 25),),
//          Text("传递的信息:${widget.message}")
        ],
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print('第6个生命周期函数:dispose销毁方法(继承自State的_HYHomeContentState组件)');
  }
  Widget _getButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RaisedButton(
          child: Text("+", style: TextStyle(fontSize: 20, color: Colors.white),),
          color: Colors.pink,
          onPressed: () {
            setState(() {
              _counter++;
            });
          },
        ),
        RaisedButton(
            child: Text("-", style: TextStyle(fontSize: 20, color: Colors.white),),
            color: Colors.purple,
            onPressed: () {
              setState(() {
                _counter--;
              });
            }
        ),
      ],
    );
  }
}

