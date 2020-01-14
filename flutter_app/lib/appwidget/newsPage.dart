import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewsDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print("NewsDetailPage-build");
    return NewsDetailPageFul();
  }
}

class NewsDetailPageFul extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    print("NewsDetailPageFul-createState");
    return NewsPageWidgetState();
  }
}

class NewsPageWidgetState extends State<NewsDetailPageFul> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print("NewsPageWidgetState-build");
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("消息详情"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text("消息详情界面"),
            RaisedButton(
              onPressed: _onBtnClick,
              child: Text("返回上一个界面"),
            ),
          ],
        ),
      ),
    );
  }

  void _onBtnClick(){
    Navigator.pop(context);
  }

}
