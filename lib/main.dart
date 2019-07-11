import 'package:flutter/material.dart';
import 'package:xd_flutter/MainPage.dart';
void main() => runApp(MyApp());



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes:{

      },
      title: 'Fullter教程',
      theme: ThemeData(
        primaryColor: Colors.cyan
      ),
      home: new MainPage(title: "页面顶部标题栏",),
    );
  }

}