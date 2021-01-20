import "dart:io";

main(List<String> args) {
  print(getNetworkdata());
}

// 模拟一个网络请求
String getNetworkdata() {
  sleep(Duration(seconds: 2));
  return "hello world";
}
