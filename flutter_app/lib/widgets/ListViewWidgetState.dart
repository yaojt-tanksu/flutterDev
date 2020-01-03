import 'package:flutter/material.dart';

import 'ListViewWidget.dart';

class ListViewWidgetState extends State<ListViewWidget> {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: buildList(),
    );
  }

  Widget buildList() {
    var list = new Scaffold(
        appBar: new AppBar(centerTitle: true, title: new Text("listview demo")),
        body: new ListView.builder(
          itemCount: 100,
          itemExtent: 40,
          padding: EdgeInsets.all(10),
          itemBuilder: buildItem,
        ));
    return list;
  }

  //ListView的Item
  Widget buildItem(BuildContext context, int index) {
//    if (index.isOdd) return Divider();
    var textStyle = new TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    var text = new Text(
      "item $index",
      style: textStyle,
    );
    var padding = new Padding(
      padding: const EdgeInsets.all(8),
      child: text,
    );
    var ges = new FlatButton(
      child: new Card(
        child: padding,
      ),
      onPressed: () {
        print("click $index");
        _onItemClicked(index);
      },
    );
    return ges;
  }

  void _onItemClicked(int index){
    Navigator.of(context).push(
      new MaterialPageRoute(builder: (BuildContext context){
        return new Scaffold(
          appBar: new AppBar(
            title: Text("item detail"),
            centerTitle: true,
          ),
          body: Center(
            child: Image.asset('images/lake.jpg'),
          ),
        );
      },)
    );
  }
}
