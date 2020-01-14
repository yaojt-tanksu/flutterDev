import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/appwidget/newsPage.dart';

class LifeCycleAppPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print("LifeCycleAppPage-build");
    return LifecycleAppPage();
  }
}

class LifecycleAppPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    print("LifecycleAppPage-createState");
    return _LifeCircleAppPageState();
  }
}


///
/// 启动一个A页面的时候
/// B界面
/// 1、initState
/// 2、didChangeDependencies
/// 3、build
/// 同时A页面：
/// 1、会调用：build方法
///
/// 再启动C界面
/// C界面：
/// 1、createState
/// 2、build
/// B界面
/// deactivate
/// build
/// A界面
/// build
///
/// C界面退回到B界面
/// B界面
/// 1、deactivate
/// 2、build
/// A界面
/// 1、build
///
/// 再回到A界面
/// 启动界面
/// 1、build
/// B界面
/// 1、deactivate
/// 2、dispose
///
class _LifeCircleAppPageState extends State<LifecycleAppPage>
    with WidgetsBindingObserver {
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    super.didChangeAppLifecycleState(state);
    print("_LifeCircleAppPageState-didChangeAppLifecycleState");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("_LifeCircleAppPageState-initState");
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print("_LifeCircleAppPageState-didChangeDependencies");

  }

  @override
  void didUpdateWidget(LifecycleAppPage oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print("_LifeCircleAppPageState-didUpdateWidget");

  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    print("_LifeCircleAppPageState-deactivate");

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("_LifeCircleAppPageState-dispose");

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print("_LifeCircleAppPageState-build");

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("APP生命周期"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text("生命周期界面"),
            RaisedButton(
              onPressed: _onBtnClick,
              child: Text("去消息详情界面"),
            ),
          ],
        ),
      ),
    );
  }

  void _onBtnClick() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => NewsDetailPageFul(),
    ));
  }
}
