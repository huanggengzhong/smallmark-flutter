import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: '豆瓣',
        theme: ThemeData(
            primaryColor: Colors.green,
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent),
        home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter=100;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      2.在最顶级里用HYCounterWidget组件包裹
      body:HYCounterWidget(
//        下面这里的counter就是共享的数据
        counter:_counter,
        child: Column(
          children: <Widget>[
            HYShowData01(),
            HYShowData02(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          setState(() {
            _counter++;
          });
        },
      ),
    );
  }
}

//数据共享状态组件
//1.先定义一个共享组件HYDataWidget,里面一般都是这四步:共享的数据=>定义构造方法=>获取组件最近的当前InheritedWidget=>要不要回调state里的didChangeDependencies生命周期方法
class HYCounterWidget extends InheritedWidget {
//  这里是共享数据,比如下面的count
  final int counter;

  //构造函数里要调用父级的super方法,并传递child
  HYCounterWidget({this.counter,Widget child}):super(child:child);

  //声明一个of(一般都叫这个)方法
  static HYCounterWidget of(BuildContext context){
//    dependOnInheritedWidgetOfExactType方法的作用是会沿着Element树去找最近的HYCounterElement,从Element中取出Widget对象
    return context.dependOnInheritedWidgetOfExactType();
  }

  bool updateShouldNotify(HYCounterWidget oldWidget){
//    这里如果返回false,那么生命周期didChangeDependencies不会执行
    print(oldWidget.counter);
    return oldWidget.counter!=counter;
  }
}

//子组件HYShowData01
class HYShowData01 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    3.获取之前的数据
    int counter=HYCounterWidget.of(context).counter;
    return Container(
      color:Colors.red,
      child: Text('子组件1获取的数据:$counter'),
    );
  }
}
//子组件HYShowData02
class HYShowData02 extends StatefulWidget {
  @override
  _HYShowData02State createState() => _HYShowData02State();
}


class _HYShowData02State extends State<HYShowData02> {

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print("执行了didChangeDependencies生命周期");
  }

  @override
  Widget build(BuildContext context) {
    int counter=HYCounterWidget.of(context).counter;
    return Container(
      color:Colors.blue,
      child: Text('子组件2获取的数据:$counter'),
    );
  }
}
