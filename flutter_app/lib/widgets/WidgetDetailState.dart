import 'package:flutter/material.dart';

import 'WidgetDetail.dart';
import 'package:fluttertoast/fluttertoast.dart';

class WidgetDetailState extends State<WidgetDetail> {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Scaffold(
        appBar: new AppBar(
          centerTitle: true,
          title: new Text("Widget test"),
        ),
        body: createContainer(),
      ),
    );
  }

  Widget createContainer() {
    var container = new Container(
      decoration: new BoxDecoration(
        color: Colors.grey,
      ),
      child: new ListView(
        children: <Widget>[
          new GestureDetector(
            child: new Row(
              children: <Widget>[
                new Expanded(child: createItemBox()),
                new Expanded(child: createItemBox()),
              ],
            ),
            onTap: (){
              print("click");
//              Fluttertoast.showToast(
//                  msg: "Toast提示信息",
//                  toastLength: Toast.LENGTH_SHORT,
//                  gravity: ToastGravity.CENTER,
//                  timeInSecForIos: 1,
//                  backgroundColor: Colors.red,
//                  textColor: Colors.white,
//                  fontSize: 16.0
//              );
            },
          ),

          new Row(
            children: <Widget>[
              new Expanded(child: createItemBox()),
              new Expanded(child: createItemBox()),
            ],
          ),
          new Row(
            children: <Widget>[
              new Expanded(child: createItemBox()),
              new Expanded(child: createItemBox()),
            ],
          ),
          new Row(
            children: <Widget>[
              new Expanded(child: createItemBox()),
              new Expanded(child: createItemBox()),
            ],
          ),
        ],
      ),
    );
    return container;
  }

  Widget createItemBox() {
    var itemBox = new Container(
      decoration: new BoxDecoration(
        border: new Border.all(
          color: Colors.black38,
          width: 2,
        ),
        borderRadius: const BorderRadius.all(const Radius.circular(16.0)),
      ),
      margin: new EdgeInsets.all(4),
      child: new Image.asset('images/logo.jpg'),
    );
    return itemBox;
  }

  Widget createText() {
    var textScaffold = new Scaffold(
      appBar: new AppBar(
        title: new Text("Text overflow"),
      ),
      body: new ListView(
        children: List.generate(100, (idx) => Text("Short text")),
      ),
    );
    return textScaffold;
  }

  Widget createRow() {
    Widget row = Center(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          new Image.asset('images/earth.jpg'),
          new Image.asset('images/earth.jpg'),
          new Image.asset('images/earth.jpg'),
        ],
      ),
    );
    return row;
  }
}
