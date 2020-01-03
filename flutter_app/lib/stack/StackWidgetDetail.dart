import 'package:flutter/material.dart';

class StackWidgetDetail extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return buildStack();
  }

  Widget buildStack() {
    var stack = new Stack(
      alignment: const Alignment(0, 0),//属性和调整文本偏移
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
