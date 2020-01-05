import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/ToastUtli.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ListViewItem extends StatelessWidget {
  var controller = new ScrollController();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return NotificationListener(
        onNotification: (ScrollNotification notification) {
          print("列表滚动了！${notification.metrics.pixels}");
          //滚动的距离 >0 的
          if (notification.metrics.pixels > 300) {
            _scrollTo(0);
          }
        },
        child: ListView.builder(
            itemCount: 70,
            controller: controller,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
                child: Text(
                  "今天天气真好！$index",
                  style: TextStyle(
                      backgroundColor: Colors.greenAccent, fontSize: 14.0),
                ),
              );
            }),
      );
    });
  }

  // 点击时滚动到某个位置。
  void _scrollTo(double offset) {
    if (null != controller) {
      controller.animateTo(offset,
          duration: Duration(milliseconds: 300), curve: Curves.bounceIn);
    }
  }
}

class RefereshUpDown extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RefereshLayout();
  }
}

class RefereshLayout extends State<RefereshUpDown> {
  var refreshController = RefreshController(initialRefresh: true);
  List<String> items = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "2",
    "3",
    "4",
    "5",
    "6",
    "2",
    "3",
    "4",
    "5",
    "6",
    "2",
    "3",
    "4",
    "5",
    "6",
    "2",
    "3",
    "4",
    "5",
    "6"
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("refreshList"),
      ),
      backgroundColor: Colors.white,
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Container(
      child: SmartRefresher(
        enablePullDown: true,
//        enablePullUp: true,
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        onOffsetChange: (bool up, double offset) {
//          print("onOffsetChange,up:$up ,offset:$offset");
        },
        controller: refreshController,

        // WaterDropHeader、ClassicHeader、CustomHeader、LinkHeader、MaterialClassicHeader、WaterDropMaterialHeader
        header: ClassicHeader(
          height: 45.0,
          refreshingText: '刷新中',
          completeText: '完成了',
          failedText: '失败了',
          idleText: '下拉刷新',
          releaseText: '松开刷新',
          releaseIcon: Image.asset("images/up.png"),
        ),
        // ClassicFooter、CustomFooter、LinkFooter、LoadIndicator

        footer: ClassicFooter(
          height: 45.0,
          loadingText: '加载中,请稍后...',
          failedText: '加载失败,请稍后重试!',
          idleText: '上拉加载更多',
          noDataText: '没有更多数据了',
          canLoadingText: '松开加载更多',
          canLoadingIcon: Image.asset("images/down.png"),
        ),
//        footer: CustomFooter(
//          builder: (BuildContext context, LoadStatus mode) {
//            Widget body;
//            if (mode == LoadStatus.idle) {
//              body = Text("上拉加载更多");
//            } else if (mode == LoadStatus.loading) {
//              body = CupertinoActivityIndicator();
//            } else if (mode == LoadStatus.failed) {
//              body = Text("加载失败，点击重试");
//            } else if (mode == LoadStatus.noMore) {
//              body = Text("没有更多数据了！");
//            } else {
//              body = Text("松开加载更多");
//            }
//            return Container(
//              height: 45.0,
//              child: Center(child: body),
//            );
//          },
//        ),

        child: Center(
          child: Text("center"),
        ),
//        child: ListView.builder(
//          itemExtent: 50.0,
//          itemBuilder: (BuildContext context, int index) {
//            return GestureDetector(
//              onTap: () {
//                print("onclick ${items[index]}");
//                Future result = Navigator.push(
//                    context,
//                    MaterialPageRoute(
//                        builder: (context) => DetailLayout(items[index])));
//                result.then((value) {
////                  print("on back:$value");
//                  Scaffold.of(context).showSnackBar(SnackBar(
//                    content: Text(value),
//                    action: SnackBarAction(
//                      label: "确定",
//                      onPressed: () {
//                        Toast.toast(context, msg: "点击了snackbar！");
//                      },
//                    ),
//                  ));
//                });
//              },
//              child: Container(
//                padding: EdgeInsets.only(top: 5, bottom: 5),
//                child: Column(
//                  mainAxisAlignment: MainAxisAlignment.center,
//                  crossAxisAlignment: CrossAxisAlignment.center,
//                  children: <Widget>[
//                    Expanded(
//                      child: Text(
//                        "今天天气如何？${items[index]}",
//                        textAlign: TextAlign.center,
//                        style: TextStyle(color: Colors.red),
//                      ),
//                    ),
//                    Expanded(
//                      child: Divider(
//                        height: 1,
//                        color: Colors.red,
//                      ),
//                    ),
//                  ],
//                ),
//              ),
//            );
//          },
//          itemCount: items.length,
//        ),
      ),
    );
  }

  void _onRefresh() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    items.clear();
    setState(() {});
    refreshController.refreshCompleted();
  }

  void _onLoading() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    items.add((items.length + 1).toString());
    items.add((items.length + 1).toString());
    items.add((items.length + 1).toString());
    items.add((items.length + 1).toString());
    items.add((items.length + 1).toString());
    items.add((items.length + 1).toString());
    items.add((items.length + 1).toString());
    items.add((items.length + 1).toString());
    if (mounted) setState(() {});
    refreshController.loadComplete();
  }

  @override
  void dispose() {
    refreshController.dispose();
    super.dispose();
  }
}

class DetailLayout extends StatelessWidget {
  String title;

  DetailLayout(this.title);

  void _onPop() {}

  _showDialog(BuildContext context) {
    showDialog(
      context: context,
      child: AlertDialog(
          title: Text("提示"),
          content: Text('是否确认退出当前页面?'),
          actions: [
            FlatButton(
              child: Text("取消"),
              onPressed: () {},
            ),
            FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                  if (Navigator.canPop(context)) {
                    Navigator.pop(context, "alert:hi,this a back value");
                  } else {
//                SystemNavigator.pop();
                  }
                },
                child: Text('确定')),
          ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("detail page"),
        actions: <Widget>[
//          RaisedButton(
//            child: Text("m1"),
//          ),
//          RaisedButton(child: Text("m2"),),
        ],
//        automaticallyImplyLeading: false,//是否隐藏actionbar的返回按钮
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(
              title,
              style: TextStyle(fontSize: 30, color: Colors.red),
            ),
            RaisedButton(
              child: Text("back"),
              onPressed: () => {
                _showDialog(context)
//                Navigator.pop(context, "hi,this a back value")
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ListViewBuilder extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ListViewBuilder();
  }
}

class _ListViewBuilder extends State<ListViewBuilder> {
  List<int> datas = List.generate(50, (index) {
    return index;
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: ListView(
//        children: _getDefaultListItem(),
        children: _getCustomListItem(),
      ),
    );
  }

  _getCustomListItem() {
    return datas.map((int index) {
      return Container(
        margin: EdgeInsets.only(top: 1,bottom: 1),
        color: Colors.white,
        padding:
            EdgeInsets.only(top: 5.0, bottom: 5.0, left: 15.0, right: 15.0),
        child: Row(
          children: <Widget>[
            CircleAvatar(
              child: Text("$index"),
            ),
            Container(
              padding: EdgeInsets.only(left: 10.0),
              child: Text("海纳百川?$index"),
            ),
          ],
        ),
      );
    }).toList();
  }

  _getDefaultListItem() {
    return datas.map((int index) {
      return ListTile(
        isThreeLine: true,
        dense: false,
        leading: CircleAvatar(
          child: Text("$index"),
        ),
        subtitle: Text("副标题$index"),
        title: Text("主标题$index"),
        trailing: Icon(
          Icons.arrow_right,
          color: Colors.green,
        ),
      );
    }).toList();
  }

  //返回正常的item
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      backgroundColor: Colors.white,
//      body: ListView.builder(
//        scrollDirection: Axis.horizontal,
//          itemCount: datas.length,
//          itemExtent: 50,
//          itemBuilder: (context, index) {
//            if(datas.length-1==index){
//              //到列表底部了
//              _requestMoreData(20);
//            }
//            return Text("item: $index");
//          }),
//    );
//  }

  //返回带有分割线的item
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      backgroundColor: Colors.white,
//      body: ListView.separated(
//        scrollDirection: Axis.vertical,
//          itemBuilder: (context, index) {
//            return Divider(
//              height: 3,
//              color: Colors.redAccent,
//            );
//          },
//          separatorBuilder: (context, index) {
//            if (datas.length - 1 == index) {
//              _requestMoreData(10);
//            }
//            return Center(
//              child: Text("item$index"),
//            );
//          },
//          itemCount: datas.length),
//    );
//  }

  void _requestMoreData(int count) {
    Future.delayed(Duration(milliseconds: 1000)).then((e) {
      datas.addAll(List.generate(count, (index) {
        return index;
      }));
      setState(() {});
    });
  }
}
