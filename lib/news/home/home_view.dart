import 'package:flutter/material.dart';



import 'children/swiper_widget.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (BuildContext context,int index){
      if(index == 0 ){
        return SwiperWidget();
      }else{
        return Container(
          child: Text("haha"),
        );
      }
    },itemCount: 10,);
  }
}
