main(List<String> args) {
  print("main function start");

  Future.delayed(Duration(seconds: 3), () {
    return "3秒后的信息";
  }).then((value) {
    print(value);
  });

  print("main function end");
}
