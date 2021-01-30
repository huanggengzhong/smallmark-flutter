import 'package:flutter/material.dart';
import 'package:flutterapp3/service/http_request.dart';

//import ' service/http_request.dart';
class HomeContent extends StatefulWidget {
  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //这里发送网络请求
    HttpRequest.request('/get', params: {"name": 'why'}).then((res) {
      print('get请求打印结果:$res');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: 30,
        itemBuilder: (ctx, index) {
          return ListTile(
            title: Text('item$index'),
          );
        },
      ),
    );
  }
}
