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
          child: Row(
            children: [
              Container(
                child: Image.network("",width: 130,height: 110,),
                color: Colors.grey,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text("新闻标题",maxLines:2,overflow:TextOverflow.ellipsis,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                    margin: EdgeInsets.only(left:10,top: 10,right: 10),
                    width: MediaQuery.of(context).size.width-130-20,
                  ),
                  Container(
                    child:  Text("新闻来源"),
                    margin: EdgeInsets.only(left: 10,top: 5),
                  ),
                  Container(
                    child:  Text("发布时间"),
                    margin: EdgeInsets.only(left: 10,top: 5),
                  ),
                ],
              )
            ],
          ),
        );
      }
    },itemCount: 10,);
  }
}
