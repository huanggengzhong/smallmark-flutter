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
        title:Text('布局组件') ,
      ),

//      body:AlignDemo()
//        body:CenterDemo()
    body: ContainerDemo(),
    );
  }
}
//Align组件
class AlignDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
        height: 200,
        color: Colors.red,
        child: Align(
          alignment: Alignment(0.5,0.5),
          child: Icon(Icons.pets,size: 50,),
        ),
    );
  }
}

// Center组件
class CenterDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child:Icon(Icons.pets,size: 36,color: Colors.red,),
      widthFactor: 8,
        heightFactor: 12,
    );
  }
}

//container组件
class ContainerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 150,
        height: 150,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blue,width: 2),
          image: DecorationImage(
            image: NetworkImage("https://tva1.sinaimg.cn/large/006y8mN6gy1g7aa03bmfpj3069069mx8.jpg")
          ),shape: BoxShape.circle

        )
        ,
      ),
    );
  }
}

