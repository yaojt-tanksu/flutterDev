import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/appwidget/pageLifeCircle.dart';

class LifeStartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print("NewsDetailPage-build");
    return StartDetailPageFul();
  }
}

class StartDetailPageFul extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    print("NewsDetailPageFul-createState");
    return StartPageWidgetState();
  }
}

class StartPageWidgetState extends State<StartDetailPageFul> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print("StartPageWidgetState-build");
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("启动界面"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text("启动界面UI"),
            RaisedButton(
              onPressed: _onBtnClick,
              child: Text("去生命周期界面"),
            ),
          ],
        ),
      ),
    );
  }

  void _onBtnClick() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return LifeCycleAppPage();
    }));
  }
}
