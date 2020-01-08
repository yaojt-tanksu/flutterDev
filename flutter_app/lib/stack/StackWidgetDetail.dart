import 'package:flutter/material.dart';

class StackWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StackWidgetDetail();
  }
}

class StackWidgetDetail extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return buildStack();
  }

  Widget buildStack() {
    var stack = new Stack(
      alignment: const Alignment(0, 0), //属性和调整文本偏移
      children: <Widget>[
        new CircleAvatar(
          backgroundImage: new AssetImage('images/earth.jpg'),
          radius: 100,
        ),
        Container(
          decoration: BoxDecoration(color: Colors.black45),
          child: Text(
            "tanksu",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              backgroundColor: Colors.transparent,
            ),
          ),
        ),
      ],
    );
    var scaffold = new Scaffold(
      appBar: new AppBar(
        title: Text("stack widget"),
        centerTitle: true,
      ),
      body: stack,
    );
    return scaffold;
  }
}

class StackWidgetLayout extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StackViewBuilder();
  }
}

class StackViewBuilder extends State<StackWidgetLayout> {
  @override
  Widget build(BuildContext context) {
    var stack = new Stack(
      alignment: const FractionalOffset(0.5, 0.7),
      children: <Widget>[
        new CircleAvatar(
          backgroundImage: new NetworkImage("https://avatars2.githubusercontent.com/u/41252899?s=460&v=4"),
          radius: 100.0,
        ),
        new Positioned(
          top: 10.0,
          left: 10.0,
          child: new Text("YFC"),
        ),
        new Positioned(
          bottom: 10.0,
          right: 10.0,
          child: new Text("https://ayang818.github.io/"),
        )
      ],
    );

    Widget stack2=Stack(//取宽高最大的控件为宽高
      alignment: FractionalOffset(0.5,0.9),
      children: <Widget>[
        CircleAvatar(
          backgroundImage: NetworkImage("https://avatars2.githubusercontent.com/u/41252899?s=460&v=4"),
          radius: 70.0,
        ),
        Container(
//          height: MediaQuery.of(context).size.height/2,
//          alignment: Alignment.bottomCenter,//如果设置了该属性，那么就需要宽度铺满才能够计算水平居中
          padding: EdgeInsets.all(2.0),
          decoration: BoxDecoration(color: Colors.pinkAccent,borderRadius: BorderRadius.all(Radius.circular(10.0))),
          child: Text("tanksu"),
        ),
        Container(
          child: Text("id"),
        ),
        Positioned(//这个控件可以覆盖alignment属性
          top: 10.0,//这几个属性是设置该控件距离左上右下边界的距离
          left: 10.0,
          right: 20.0,
          bottom: 10.0,
          child: Text("nickname-nickname-nickname-nickname-nickname"),
        ),
      ],
    );
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("stack"),
      ),
      body: Container(
        child: stack2,
      ),
//      body: Container(
//        color: Colors.red,
////        width: MediaQuery.of(context).size.width,
////        height: MediaQuery.of(context).size.height/2,
//        child: Stack(
//          alignment: Alignment.bottomCenter,
//          textDirection: TextDirection.rtl,
//          children: <Widget>[
//            Image.network("http://img2.cxtuku.com/00/13/12/s97783873391.jpg",),
////            Image.asset("images/lake.jpg",width: 300,),
//            Positioned(
//              left: 35.0,
//              right: 35.0,
//              top: 40.0,
//              child: Text(
//                "Whatever is worth doing is worth doing well",
//                style: TextStyle(
//                  fontFamily: 'serif',
//                  fontSize: 20.0,
//                ),
//              ),
//            )
//          ],
//        ),
//      ),
    );
  }
}
