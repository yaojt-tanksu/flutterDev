import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WrapWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return buidlLayout(context);
  }

  Widget buidlLayout(BuildContext context) {
    double deviceWidth=MediaQuery.of(context).size.width;
    double itemWidth=deviceWidth*110/360;
    Widget wrapwidget = Wrap(
      spacing: 5, //主轴上子控件的间距
      runSpacing: 5, //交叉轴上子控件之间的间距
      children: _boxs(itemWidth),
    );
    Widget body=Scaffold(
      appBar: AppBar(
        title: Text("wrap控件的使用1"),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          wrapwidget,
        ],
      ),
    );
    return body;
  }

  List<Widget> _boxs(double itemWidth) => List.generate(40, (index) {
        return Container(
          width: itemWidth,
          height: 100,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.orangeAccent,
              Colors.orange,
              Colors.deepOrange
            ]),
          ),
          child: Text(
            "item ${index}",
            style: TextStyle(
              fontSize: 20,
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      });
}
