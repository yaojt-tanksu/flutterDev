import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/utlis/colors.dart';

class KeyUseWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return KeyUserWidgetBuilder();
  }
}

class KeyUserWidgetBuilder extends State<KeyUseWidget> {
  List<Widget> widgets;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widgets = [
//      StatelessColorTile(),
//      StatelessColorTile(),
      StatefulColorTile(
        key: Key("pic3"),
      ),
      StatefulColorTile(
        key: Key("pic4"),
      ),
    ];
  }

  @override
  void reassemble() {
    // TODO: implement reassemble
    super.reassemble();
    widgets.clear();
    widgets = [
//      StatelessColorTile(),
//      StatelessColorTile(),

//    StatefulColorTile(),
//      StatefulColorTile(),
      StatefulColorTile(
        key: Key("pic1"),
      ),
      StatefulColorTile(
        key: Key("pic2"),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("key的使用"),
      ),
      body: SafeArea(
        child: Column(
          children: widgets,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          changePosition();
        },
        child: Text('交换'),
      ),
    );
  }

  changePosition() {
    setState(() {
      widgets.insert(1, widgets.removeAt(0));
    });
  }
}

///无状态的控件
class StatelessColorTile extends StatelessWidget {
  final Color color = ColorsUtil.randomColor();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: color,
    );
  }
}

///有状态的控件
class StatefulColorTile extends StatefulWidget {
  StatefulColorTile({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return StatefulColorTileBuilder();
  }
}

class StatefulColorTileBuilder extends State<StatefulColorTile> {
  final Color color = ColorsUtil.randomColor();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 100,
      width: 100,
      color: color,
    );
  }
}
