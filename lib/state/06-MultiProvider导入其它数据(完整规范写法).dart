import 'package:flutter/material.dart';
import 'viewModel/counter_view_model.dart';
import 'viewModel/user_view_model.dart';
import 'viewModel/init_providers.dart';
import 'package:provider/provider.dart';


void main() {
  return runApp(
//    使用MultiProvider共享多个model使用方式
      MultiProvider(
          providers: providers,
          child: MyApp()
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          HYShowData01(),
          HYShowData02(),
          HYShowData03()
        ],
      ),
//      4.改变数据的方式
      floatingActionButton: Selector<HYCounterViewModel, HYCounterViewModel>(
        selector: (ctx, counterVM) => counterVM, //这里实际可以进行类型的转换
        shouldRebuild: (pre, next) => false, //是否需要重新构建,false代表不需要,以节约性能
        builder: (ctx, counterVM, child) {
          print("floatingActionButton的build方法(实际这里点击时没必要build)");
          return FloatingActionButton(
            child: child,
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
//这里使用另一个模块数据
class HYShowData03 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("data03使用Consumer触发build");
    return Container(
//      使用consumer来取数据
      color: Colors.green,
      child: Consumer<UserViewModel>(
        builder: (ctx, counterVM, child) {
          print("这是data3里的Consumer中的build方法");
          return Text('子组件3使用MultiProvider方式获取另一个模块的数据:${counterVM.user.nickName}');
        },
      ),
    );
  }
}
