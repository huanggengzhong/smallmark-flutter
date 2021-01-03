import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main()=>  runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text('字体图标和图片练习') ,
      ),

//        body: ImageExtensionDemo()//图片组件
//      body: IconExtensionDemo(),//字体图标组件
      body:RichWord(),
    );
  }
}

//文本分片
class RichWord extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
          children: [
            TextSpan(
                text:'定风波',
                style:TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.black)
            ),
            TextSpan(text: "苏轼", style: TextStyle(fontSize: 18, color: Colors.redAccent)),
            TextSpan(text: "\n莫听穿林打叶声，何妨吟啸且徐行。\n竹杖芒鞋轻胜马，谁怕？一蓑烟雨任平生。")

          ]
      ),
      style: TextStyle(fontSize: 20,color: Colors.purple),
      textAlign:TextAlign.center,
    );
  }
}


class IconExtensionDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Icon字体图标和图片图标
    // 1.字体图标矢量图(放大的时候不会失真)
    // 2.字体图标可以设置颜色
    // 3.图标很多时, 占据空间更小
//    return Icon(Icons.pets, size: 300, color: Colors.orange,);//最开始的效果,其实点击pets里面就可以看到0xe91d编码
//    return Icon(IconData(0xe91d, fontFamily: 'MaterialIcons'), size: 300, color: Colors.orange,);
//  设置字符串图标无非就是设置两个条件:unicode编码+字体
    // 1.0xe91d -> unicode编码(实际就是把0x换成\u)
    // 2.设置对应的字体(实际就是fontFamily: "MaterialIcons")
    return Text("\ue91d", style: TextStyle(fontSize: 100, color: Colors.orange, fontFamily: "MaterialIcons"),);
  }
}


class ImageExtensionDemo extends StatelessWidget {
  const ImageExtensionDemo({
    Key key,

  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
//    占位图:
    // 1.占位图的问题: FadeInImage
    // 2.图片缓存: 1000张 100m
    return FadeInImage(
      fadeOutDuration: Duration(milliseconds: 1),
      fadeInDuration: Duration(milliseconds: 1),
      placeholder: AssetImage("assets/images/juren.jpeg"),//本地图片
      image: NetworkImage("https://tva1.sinaimg.cn/large/006y8mN6gy1g72j6nk1d4j30u00k0n0j.jpg"),//网络图片
    );


  }
}



