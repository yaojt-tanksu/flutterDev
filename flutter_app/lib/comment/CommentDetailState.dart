import 'package:flutter/material.dart';

import 'CommentDetail.dart';

class CommentDetailState extends State<CommentDetail> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: new Text("CommentDetailSta"),
      ),
      body: new Center(
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child:  Column(
                children: <Widget>[
                   Container(
                    padding: EdgeInsets.only(top: 10),
                    child: new Text(
                      "StrawBerry Pavlova",
                      textAlign: TextAlign.center,
                      style: new TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ),
                   Container(
                    padding: EdgeInsets.only(top: 10),
                    child: new Text(
                      "The day broke gray and dullThe day broke gray and "
                      "dullThe day broke gray and dullThe day broke gray and dull"
                      "The day broke gray andThe day broke gray andThe day broke gray and",
                      textAlign: TextAlign.center,
                    ),
                  ),
                  createRating(),
                  new Container(
                    margin: EdgeInsets.only(top: 40),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        new Image.asset(
                          'images/earth.jpg',
                        ),
                        new Image.asset(
                          'images/earth.jpg',
                        ),
                        new Image.asset(
                          'images/earth.jpg',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget createRating() {
    var ratings = new Container(
        padding: new EdgeInsets.only(top: 20,),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                new Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    new Icon(Icons.star, color: Colors.black),
                    new Icon(Icons.star, color: Colors.black),
                    new Icon(Icons.star, color: Colors.black),
                    new Icon(Icons.star, color: Colors.black),
                    new Icon(Icons.star, color: Colors.grey[500]),
                  ],
                ),
                new Container(
                  padding: new EdgeInsets.fromLTRB(30, 0, 0, 0),
                  child: new Text(
                    '1701 Reviews',
                    style: new TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w800,
                      fontFamily: 'Roboto',
                      letterSpacing: 0.5,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ],
            ),
            createIconList(),
          ],
        ));
    return ratings;
  }

  Widget createIconList() {
    var descTextStyle = new TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w800,
      fontFamily: 'Roboto',
      letterSpacing: 0.5,
      fontSize: 18,
      height: 2,
    );

    var iconList = DefaultTextStyle.merge(
        style: descTextStyle,
        child: new Container(
          padding: new EdgeInsets.only(top: 50,),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new Column(
                children: <Widget>[
                  new Icon(
                    Icons.kitchen,
                    color: Colors.green[500],
                  ),
                  new Text("PREP:"),
                  new Text("25 min")
                ],
              ),
              new Column(
                children: <Widget>[
                  new Icon(
                    Icons.timer,
                    color: Colors.green[500],
                  ),
                  new Text('COOK:'),
                  new Text('1 hr'),
                ],
              ),
              new Column(
                children: <Widget>[
                  new Icon(
                    Icons.restaurant,
                    color: Colors.green[500],
                  ),
                  new Text('FEEDS:'),
                  new Text('4-6 min'),
                ],
              ),
            ],
          ),
        ));
    return iconList;
  }
}
