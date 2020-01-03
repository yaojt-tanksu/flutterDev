

import 'package:flutter/material.dart';

import 'CardWidget.dart';

class CardWidgetDetail extends State<CardWidget>{
  @override
  Widget build(BuildContext context) {
    return buildLayout();
  }

  Widget buildLayout(){
    var card=Card(
      color: Colors.amber,
      margin: EdgeInsets.all(30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.asset(
            'images/earth.jpg'
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text("1625 mian street"),
              Text("My city,CA 9984"),
            ],
          ),
        ],
      ),
    );

    var container=Container(
      width: 300,
      height: 10,
      child: card,
      color: Colors.red,
    );
    return container;
  }

}