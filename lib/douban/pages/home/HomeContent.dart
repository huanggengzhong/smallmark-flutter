import 'package:flutter/material.dart';
import './../../../service/http_request.dart';
import './MovieListItem.dart';
import './../../utils/log.dart';
//import ' service/http_request.dart';
class HomeContent extends StatefulWidget {
  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  List movies=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //这里发送网络请求
    getMovieList();
  }
//  获取数据的方法
  void getMovieList(){
    HttpRequest.request('/api/v2/movie/top250', params: {"name": 'why'}).then((res) {
      setState(() {
        movies.addAll(res['data']);//addAll是添加整个数组的方法
        myLog('movies:$movies',StackTrace.current);//StackTrace是一个跟踪类
//        print('movies:$movies');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: movies.length,
        itemBuilder: (BuildContext ctx, int index) {
          return MovieListItem(movies[index],index);
        },
      ),
    );
  }
}
