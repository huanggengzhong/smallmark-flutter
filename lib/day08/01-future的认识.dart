import "dart:io";

import 'dart:math';

main(List<String> args) {
  print("start");
  var future = getNetworkdata();
  future.then((dynamic res) {
    print(res);
  }).catchError((err) {
    //要链式调用,否则会报错
    print(err);
  }).whenComplete(() {
    print("代码执行完成");
  });
  print("end");
}

// // 模拟一个网络请求
// String getNetworkdata() {
//   sleep(Duration(seconds: 5)); //会阻塞
//   return "hello world";
// }

// 模拟一个网络请求
Future getNetworkdata() {
  return Future<String>(() {
    sleep(Duration(seconds: 5)); //

    throw Exception("模拟错误"); //异常

    // return "hello world";
  });
}
