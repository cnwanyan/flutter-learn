import 'package:flutter/material.dart';
void main() => runApp(MyApp());



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes:{
        "newRouter":(context)=>NewRouter(),
      },
      title: 'Fullter教程',
      theme: ThemeData(
        primaryColor: Colors.cyan
      ),
      home: new MyHomePage(title: "页面顶部标题栏",),
    );
  }

}


class MyHomePage extends StatefulWidget {

  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;


  @override
  _MyHomePageState createState() => new _MyHomePageState();

}

class _MyHomePageState extends State<MyHomePage>{

  int _counter = 0;

  void _incrementCounter(){
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,

        title: Text(widget.title,
          style: TextStyle(
            color: Colors.white
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("你点了这么多次按钮："),
            Text("$_counter",style: Theme.of(context).textTheme.display1,),
            FlatButton(
              onPressed: ()=>{
                Navigator.pushNamed(context, "newRouter",arguments:"Shu Cheng")
              },
              textColor: Colors.blue,
              child: Text("点击跳转"),
            )
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        backgroundColor: Colors.cyan,
        onPressed: _incrementCounter,
        tooltip: '点击加一',
        child: new Icon(Icons.add,),
      ),
    );
  }

}


class NewRouter extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    var args=ModalRoute.of(context).settings.arguments;


    return Scaffold(
      appBar: AppBar(
        title: Text('新页面',style: TextStyle(color: Colors.white),),
      ),
      body: Center(
        child: Text("欢迎您，"+args),
      ),
    );
  }

}