import 'package:flutter/material.dart';
import 'package:flutterapp3/state/viewModel/counter_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  return runApp(
//2.在自己的组件树中插入自己写好的Model组件
      ChangeNotifierProvider(
          create: (ctx)=>HYCounterViewModel(),
          child:MyApp()
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          HYShowData01(),
          HYShowData02(),
        ],
      ),
//      4.改变数据的方式
      floatingActionButton: Consumer<HYCounterViewModel>(//需要传递自己写的泛型
        builder:(ctx,counterVM,child){
          return FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: (){
              setState(() {
                counterVM.counter++;
              });
            },
          );
        } ,
      ),
    );
  }
}

//子组//子组件HYShowData01
class HYShowData01 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//  3.使用model里的数据
    int counter=Provider.of<HYCounterViewModel>(context).counter;//这里要传递自己定义组件的泛型类型
    return Container(
      color:Colors.red,
      child: Text('子组件1获取的数据:$counter'),
    );
  }
}//子组//子组件HYShowData02
class HYShowData02 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int _counter=Provider.of<HYCounterViewModel>(context).counter;
    return Container(
      color:Colors.blue,
      child: Text('子组件2获取的数据:$_counter'),
    );
  }
}

