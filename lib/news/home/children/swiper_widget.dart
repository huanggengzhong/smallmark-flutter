import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
class SwiperWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,//记住要在外层包裹一层Container,不然报hasSize错误
      child: Swiper(
        itemBuilder: (BuildContext context ,int index){
          return Container(
            width: MediaQuery.of(context).size.width,
            height: 150,
            child: Center(
              child: Text("轮播图$index",textAlign: TextAlign.center,),
            ),
          );
        },
        itemCount: 10,
        pagination: SwiperPagination(),
        control: SwiperControl(),
      ),
    );
  }
}
