import 'package:flutter/material.dart';
import 'package:flutterapp3/state/viewModel/counter_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  return runApp(
//2.在自己的组件树中插入自己写好的Model组件
      ChangeNotifierProvider(
          create: (ctx) => HYCounterViewModel(), child: MyApp()));
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          HYShowData01(),
          HYShowData02(),
        ],
      ),
//      4.改变数据的方式
      floatingActionButton: Consumer<HYCounterViewModel>(
        //需要传递自己写的泛型
        builder: (ctx, counterVM, child) {
          print("floatingActionButton的build方法(实际这里点击时没必要build)");
          return FloatingActionButton(
//            child: Icon(Icons.add),//移动到Consumer中的第二个参数child中同时将不需要重新build的组件放在chilc里,节约性能
            child: child,//Consumer可以优化的点
            onPressed: () {
              setState(() {
                counterVM.counter++;
              });
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

//子组//子组件HYShowData01
class HYShowData01 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//  3.使用model里的数据
    int counter =
        Provider.of<HYCounterViewModel>(context).counter; //这里要传递自己定义组件的泛型类型
    print("data01使用Provider.of方法触发build");
    return Container(
      color: Colors.red,
      child: Text('子组件1获取的数据:$counter'),
    );
  }
} //子组//子组件HYShowData02

class HYShowData02 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("data02使用Consumer触发build");
    return Container(
//      使用consumer来取数据
      color: Colors.blue,
      child: Consumer<HYCounterViewModel>(
        builder: (ctx, counterVM, child) {
          print("这是data2里的Consumer中的build方法");
          return Text('子组件2使用Consumer方式获取的数据:${counterVM.counter}');
        },
      ),
    );
  }
}
