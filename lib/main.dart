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
          title: Text('列表测试'),
        ),

//第一种ListView组件创建方式
//      body: ListView(
//        itemExtent: 80,
//        children: List.generate(100, (index) {
//          return ListTile(
//            leading: Icon(Icons.people),
//            trailing: Icon(Icons.delete),
//            title: Text("联系人${index + 1}"),
//            subtitle: Text('联系人手机号码:18825113670'),
//          );
//        }),
//      ),
////    第二种ListView组件创建方式,这种方式使用比较多
//        body: ListView.builder(
//            itemCount: 100,
//            itemExtent: 60,
//            itemBuilder: (BuildContext ctx, int index) {
//              return Text(
//                "hello: $index",
//                style: TextStyle(fontSize: 20),
//              );
//            })

//    第三种
        body: ListView.separated(
            itemCount: 100,
            itemBuilder: (BuildContext ctx, int index) {
              return Text("hello: $index", style: TextStyle(fontSize: 20));
            },
            separatorBuilder: (BuildContext context, int index){
              return Divider(color: Colors.red);
            }
        ));
  }
}
