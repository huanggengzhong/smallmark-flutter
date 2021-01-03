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
        title:Text('表单组件') ,
      ),

      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
//          TextFieldDemo()
          FormDemo()
        ],
      ),
    );
  }
}

//form表单的使用
class FormDemo extends StatefulWidget {
  @override
  _FormDemoState createState() => _FormDemoState();
}

class _FormDemoState extends State<FormDemo> {
  var _name='';
  var _pwd = '';
  final _formKey = GlobalKey<FormState>();//使用GlobalKey跟form中的key绑定,可以在点击按钮时，拿到 Form对象 来调用它的Form表单的save保存数据方法
  void login(name,pwd){
    print('点击登录:得到的数据是${name};${pwd}');
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
              decoration: InputDecoration(hintText: '输入账号'),
              onSaved: (value) {
                _name = value;
              },
              validator: (String value) {
                return value.length >= 3 ? null : '账号最少3个字符';
              },
              autovalidate:true//设置是否自动验证
          ),
          TextFormField(
            decoration: InputDecoration(hintText: '输入密码'),
            obscureText: true,//是否密码框
            onSaved: (value) {
              _pwd = value;
            },
            validator: (String value) {
              return value.length >= 6 ? null : '账号最少6个字符';
            },
          ),
          RaisedButton(
            child: Text('登录'),
            onPressed: () {
              var _state = _formKey.currentState;
//              print('_state:${_state.validate()}');
              if(_state.validate()){//这里验证表单有没有通过验证

                /*
                如何同时获取用户名和密码的表单信息？
我们调用Form的State对象的save方法，就会调用Form中放入的TextFormField的onSave回调：
                 */
                _state.save();//所以这里要将表单数据保存(save方法回调每一个FormField的save方法，通常情况下保存表单数据。)
                login(_name,_pwd);
              }else{
                print("验证没有通过");
              }
            },
          )
        ],
      ),
    );
  }
}



//单独textField
class TextFieldDemo extends StatefulWidget {
  @override
  _TextFieldDemoState createState() => _TextFieldDemoState();
}

class _TextFieldDemoState extends State<TextFieldDemo> {
  final textEditingController=TextEditingController();

//  initState生命周期
  void initState(){
    super.initState();
//    设置默认文本
    textEditingController.text="这是给的默认文本";

//    监听文本改变
    textEditingController.addListener(() {
      print('监听到的文本内容是:${textEditingController.text}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(
          icon: Icon(Icons.people),
          labelText: "username",
          hintText: "请输入用户名",
          border:InputBorder.none,
          filled: true
      ),
      onChanged: (value){
        print('onChanged调用了:$value');
      },
      onSubmitted: (value){
        print('onSubmitted:$value');
      },
    );
  }
}
