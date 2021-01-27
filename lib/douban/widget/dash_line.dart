/*
虚线封装组件
参数说明:
axis：确定虚线的方向,horizontal和vertical两个选择,必传;
dashedWidth：根据虚线的方向确定自己虚线的宽度；
dashedHeight：根据虚线的方向确定自己虚线的高度；
count：内部会根据设置的个数和宽高确定密度（虚线的空白间隔）,必传；
color：虚线的颜色；
案例:
             Container(
              width: 200,
              child: DashLine(axis: Axis.horizontal,count: 10,dashedWidth: 8,),
            ),
             Container(
              height: 200,
              child: DashLine(axis: Axis.vertical,count: 10,dashedHeight: 8,),
            ),
 */
import 'package:flutter/material.dart';

class DashLine extends StatelessWidget {
  final Axis axis;
  final double dashedWidth;
  final double dashedHeight;
  final int count;
  final Color color;

  DashLine(
      {@required this.axis,
        this.dashedWidth = 1,
        this.dashedHeight = 1,
        this.count,
        this.color = const Color(0xffff0000)});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        // 根据宽度计算个数
        return Flex(
          direction: this.axis,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(this.count, (int index) {
            return SizedBox(
              width: dashedWidth,
              height: dashedHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
        );
      },
    );
  }
}