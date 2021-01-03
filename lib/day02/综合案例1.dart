import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main()=> runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home:HomePage()
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("商品列表"),
        ),
        body:HomeContent()
    );
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ContentItem("Apple1", "Macbook1", "https://tva1.sinaimg.cn/large/006y8mN6gy1g72j6nk1d4j30u00k0n0j.jpg"),
        SizedBox(height: 6,),
        ContentItem("Apple2", "Macbook2", "https://tva1.sinaimg.cn/large/006y8mN6gy1g72imm9u5zj30u00k0adf.jpg"),
        SizedBox(height: 6,),
        ContentItem("Apple3", "Macbook2", "https://tva1.sinaimg.cn/large/006y8mN6gy1g72imqlouhj30u00k00v0.jpg"),
      ],
    );
  }
}

class ContentItem extends StatelessWidget {
  final String title;
  final String desc;
  final String imageUrl;
  ContentItem(this.title,this.desc,this.imageUrl);//记得要初始化构造函数
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(title,style: TextStyle(color:Color.fromARGB(255, 255, 150, 150),fontSize:25.0))
            ],
          ),
          SizedBox(height: 6,),
          Row(
            mainAxisAlignment:MainAxisAlignment.end,
            children: <Widget>[
              Text(desc)
            ],
          ),
          SizedBox(height: 6,),
          Image.network(imageUrl)
        ],
      ),
    );
  }
}



