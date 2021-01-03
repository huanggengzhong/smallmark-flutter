import 'package:flutter/material.dart';

//简写箭头函数
void main() =>runApp(MyApp());

class MyApp  extends StatelessWidget{
//  build方法
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  MaterialApp(
        debugShowCheckedModeBanner:false,
        home:HomeContent()
    );
  }
}
// StatefullWidget: 继承自StatefulWidget的类(可以接收父Widget传过来的数据)/State类(状态)
// flag: 状态
// Stateful不能定义状态 -> 创建一个单独的类, 这个类负责维护状态

class HomeContent extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return GZContentBodyState();
  }

}

class GZContentBodyState extends State<HomeContent>{
//  在State组件里面就可以定义状态了
  bool flag=true;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
            title:Text('同意协议',style:TextStyle(fontSize: 30))
        ),
        body:Center(
            child: Row(
              mainAxisAlignment:MainAxisAlignment.center,
              children: <Widget>[
                Checkbox(
                  value:flag,
                  onChanged: (value){
                    this.setState(() {
                      flag=value;
                    });
                  },
                ),
                Text(
                    "hello flutter",
//            textDirection:TextDirection.ltr,//MaterialApp风格自带排版顺序,所以这里可以去掉
                    style:TextStyle(
                        fontSize: 30,
                        color: Colors.blue
                    )
                ),
              ],
            )
        )
    );
  }

}
