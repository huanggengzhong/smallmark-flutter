import 'package:flutter/material.dart';
main(){
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("text",textDirection:TextDirection.ltr),
    );
  }
}
