import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomScrollViewRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CustomScrollViewBuilder();
  }
}

class CustomScrollViewBuilder extends State<CustomScrollViewRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_upward),
        onPressed: () {
          print("回到顶部");
        },
      ),
      backgroundColor: Colors.white,
      body: Container(
        child: CustomScrollView(
          slivers: <Widget>[
            //APPbar 包含一个导航栏
            SliverAppBar(
//              title: Text("scroll title"),

              /*
            * pinned=true，AppBar固定在顶部
            * pinned=false，AppBar不会固定在顶部
            *floating=true,下拉手势时，AppBar会先于list展开
            * floating=false，下拉手势时，需要等到list下拉完成了，AppBar才下拉展开
            *
            * */
//              pinned: true,
              floating: false,
//              snap: false,
              expandedHeight: 100.0, //展开的高度
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.parallax,
                stretchModes: <StretchMode>[StretchMode.zoomBackground],
                centerTitle: false,
                //收缩后，标题在中间展示
                title: Container(
                  margin: EdgeInsets.only(left: 0),
                  child: Text("用户昵称"),
                ),
                background: Image.asset(
                  //展开视图的背景图片
                  "images/down.png",
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high,
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.all(20.0), //该布局的padding
              sliver: SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 5.0,
                  childAspectRatio: 2,
                ),
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Container(
                      alignment: Alignment.center,
                      color: Colors.cyan[100 * (index % 9)],
                      child: Text("grid item$index"),
                    );
                  },
                  childCount: 30,
                ),
              ),
            ),
            SliverFixedExtentList(
              itemExtent: 50,
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.lightBlue[100 * (index % 9)],
                  child: Text("list item$index"),
                );
              }, childCount: 20),
            ),
          ],
        ),
      ),
    );
  }
}

class ScrollViewWidget extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return ScrollViewBuilder();
  }
}

const IMAGE_SRC = 'https://picsum.photos/id/142/600/400';

class ScrollViewBuilder extends State<ScrollViewWidget> {
  List _mune = ["全部", "待付款", "待发货", "待收货", "售后"];
  List _list = List();

  initState();

  Widget _builder(context, index) {
    Widget tempWidget;
    if (0 == index) {
      tempWidget = Container(
        padding: EdgeInsets.only(left: 10.0, right: 10.0),
        height: 50,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text("商城订单"),
            ),
            Icon(Icons.keyboard_arrow_right),
          ],
        ),
      );
    } else if (1 == index) {
      tempWidget = Divider(
        height: 1,
        color: Colors.grey,
      );
    } else if (2 == index) {
      tempWidget = Container(
        height: MediaQuery.of(context).size.width / (_mune.length - 1),
        color: Colors.white,
        child: Container(
          child: GridView.builder(
              itemCount: _mune.length,
              scrollDirection: Axis.vertical,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 1,
                crossAxisCount: _mune.length,
                crossAxisSpacing: 1,
                childAspectRatio: 1.2,
              ),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  color: Colors.white,
//                alignment: Alignment.center,
                  child: Container(
//                  alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.settings),
                        Divider(
                          height: 5,
                        ),
                        Text(_mune[index]),
                      ],
                    ),
                  ),
                );
              }),
        ),
      );
    } else if (3 == index) {
      tempWidget = Container(
        color: Colors.grey[300],
        height: 10.0,
      );
    } else {
      bool isLastItem = index == _list.length - 1;
      tempWidget = Container(
        height: isLastItem ? 80.0 : 60.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.only(
                        left: 10.0,
                      ),
                      child: Text(_list[index]),
                    ),
                  ),
                  Container(
                    child: Icon(Icons.keyboard_arrow_right),
                  ),
                ],
              ),
            ),
            Divider(
              height: !isLastItem ? 1 : 0,
              color: Colors.grey,
            ),
            Container(
              height: isLastItem ? 20 : 0,
              color: Colors.white70,
            ),
          ],
        ),
      );
    }
    return tempWidget;
  }

  @override
  Widget build(BuildContext context) {
    _list.clear();
    _list.addAll(List.generate(4, (index){return "";}));
    _list.add("联系客服");
    _list.add("抽奖机会");
    _list.add("邀请赚钱");
    _list.add("我的消息");
    _list.add("帮助中心");

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(slivers: <Widget>[
        SliverAppBar(
//          title: Text('Mine'),
          backgroundColor: Colors.pink,
          floating: false,
          snap: false,
          pinned: false,
          expandedHeight: 170,
          actions: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 16),
              child: Icon(Icons.settings),
            ),
          ],
//          leading: Icon(Icons.home),
          flexibleSpace: Stack(
            alignment: const Alignment(0, 0),
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Image.network(
                      IMAGE_SRC,
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width,
                    ),
                  ),
                ],
              ),
              Container(
                height: 170,
                padding: EdgeInsets.all(10.0),
                width: MediaQuery.of(context).size.width,
//                color: Colors.grey,
                child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.only(top: 20.0),
//                        color: Colors.redAccent,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            CircleAvatar(
                              child: Icon(
                                Icons.people,
                              ),
                            ),
                            Text(
                              "    登录/注册",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
//                        color: Colors.orangeAccent,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: Container(
                                alignment: Alignment.center,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      "---",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    Text(
                                      "账户余额",
                                      style: TextStyle(color: Colors.white),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                alignment: Alignment.center,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      "---",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    Text(
                                      "优惠券",
                                      style: TextStyle(color: Colors.white),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            _builder,
            childCount: _list.length,
          ),
        ),
      ]),
    );
  }
}

class MinePageWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MinePageWidgetBuilder();
  }
}

class MinePageWidgetBuilder extends State<MinePageWidget> {
  List _list = List.generate(20, (index) => 'Item - $index');

  Widget _builder(context, index) {
    return Container(
      child: ListTile(
        title: Text(_list[index]),
        leading: Image.asset("images/up.png"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildBuilderDelegate(
              _builder,
              childCount: _list.length,
            ),
          ),
        ],
      ),
    );
  }
}
