import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
//import 'dart:async' show Future;
//import 'package:flutter/services.dart' show rootBundle;


//Future<String> loadAsset() async {
//  return await rootBundle.loadString("assets/config.json");
//}



void main() => runApp(MyApp());



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes:{
        "newRouter":(context)=>NewRouter(),
        "stateRouter":(context)=>CounterWidget(),
        "stateMRouter":(context)=>TapboxA(),
        "statePRouter":(context)=>ParentWidget(),
        "baseCptRouter":(context)=>BaseWodget(),
      },
      title: 'Fullter教程',
      theme: ThemeData(
        primaryColor: Colors.cyan
      ),
      home: new MyHomePage(title: "页面顶部标题栏",),
    );
  }

}

class BaseWodget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("基础组件",style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: Center(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                color: Colors.blue,
                highlightColor: Colors.blue[700],
                colorBrightness: Brightness.dark,
                splashColor: Colors.grey,
                child: Text("Submit"),
                shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                onPressed: () => {},
              ),
            ],
          )
      ),
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
              child: Text("点击跳转到随机字符页面"),
            ),
            FlatButton(
              onPressed: ()=>{
                Navigator.pushNamed(context, "stateRouter")
              },
              textColor: Colors.blue,
              child: Text("点击跳转到生命周期页面"),
            ),
            FlatButton(
              onPressed: ()=>{
                Navigator.pushNamed(context, "stateMRouter")
              },
              textColor: Colors.blue,
              child: Text("管理自己状态管理"),
            ),
            FlatButton(
              onPressed: ()=>{
                Navigator.pushNamed(context, "statePRouter")
              },
              textColor: Colors.blue,
              child: Text("父级管理状态"),
            ),
            FlatButton(
              onPressed: ()=>{
                Navigator.pushNamed(context, "baseCptRouter")
              },
              textColor: Colors.blue,
              child: Text("基础组件"),
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
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("欢迎您，"+args),
              RandomWordsWidget(),
              Image(
                  image: NetworkImage(
                      "https://cdn.jsdelivr.net/gh/flutterchina/flutter-in-action@1.0/docs/imgs/image-20180829174100598.png"),
                  width: 100.0,
                color: Colors.red,
                colorBlendMode: BlendMode.screen,
              ),
            ],
          ),
        ],
      ),
    );
  }

}



class RandomWordsWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final wordPair = new WordPair.random();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(wordPair.toString()),
    );
  }

}


class CounterWidget extends StatefulWidget {
  const CounterWidget({
    Key key,
    this.initValue:0
  });

  final int initValue;

  @override
  _CounterWidgetState createState() =>  _CounterWidgetState();

}

class _CounterWidgetState extends State<CounterWidget>{

  int _counter;

  @override
  void initState() {
    super.initState();
    //初始化状态
    _counter=widget.initValue;
    print("initState");
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      appBar: AppBar(
        title: Text("生命周期"),
      ),
      body: Center(
        child: FlatButton(
          child: Text('$_counter'),
          //点击后计数器自增
          onPressed:()=>setState(()=> ++_counter,
          ),
        ),
      ),
    );
  }

  @override
  void didUpdateWidget(CounterWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget");
  }

  @override
  void deactivate() {
    super.deactivate();
    print("deactive");
  }

  @override
  void dispose() {
    super.dispose();
    print("dispose");
  }

  @override
  void reassemble() {
    super.reassemble();
    print("reassemble");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies");
  }

}


class TapboxA extends StatefulWidget {
  TapboxA({Key key}) : super(key: key);

  @override
  _TapboxAState createState() => new _TapboxAState();
}

class _TapboxAState extends State<TapboxA> {
  bool _active = false;

  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }

  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: _handleTap,
      child: new Container(
        child: new Center(
          child: new Text(
            _active ? 'Active' : 'Inactive',
            style: new TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: new BoxDecoration(
          color: _active ? Colors.lightGreen[700] : Colors.grey[600],
        ),
      ),
    );
  }
}


// ParentWidget 为 TapboxB 管理状态.

//------------------------ ParentWidget --------------------------------

class ParentWidget extends StatefulWidget {
  @override
  _ParentWidgetState createState() => new _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  bool _active = false;

  void _handleTapboxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new TapboxB(
        active: _active,
        onChanged: _handleTapboxChanged,
      ),
    );
  }
}

//------------------------- TapboxB ----------------------------------

class TapboxB extends StatelessWidget {
  TapboxB({Key key, this.active: false, @required this.onChanged})
      : super(key: key);

  final bool active;
  final ValueChanged<bool> onChanged;

  void _handleTap() {
    onChanged(!active);
  }

  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: _handleTap,
      child: new Container(
        child: new Center(
          child: new Text(
            active ? 'Active' : 'Inactive',
            style: new TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: new BoxDecoration(
          color: active ? Colors.lightGreen[700] : Colors.grey[600],
        ),
      ),
    );
  }
}