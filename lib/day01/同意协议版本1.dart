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




class HomeContent extends StatelessWidget{
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
                    value:true,
                    onChanged: (value)=>print(value)
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
