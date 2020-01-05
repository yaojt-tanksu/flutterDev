import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GridViewBuilder extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _GridViewItemBuilder();
  }
}

class _GridViewItemBuilder extends State<GridViewBuilder> {
  List<String> datas = List.generate(40, (index) {
    return "index2 $index";
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 10,
              crossAxisCount: 3,
              crossAxisSpacing: 5,
              childAspectRatio: 0.5,
            ),
            itemCount: datas.length,
            itemBuilder: (context, index) {
              if(datas.length-1==index){
                //加载更多
                _loadMoreDta();
              }
              return Container(
                color: Colors.yellowAccent,
                alignment: Alignment.center,
                child: Text(datas[index]),
              );
            }),
      ),
    );
  }

  void _loadMoreDta(){
    Future.delayed(Duration(milliseconds: 1000)).then((e){
      setState(() {
        datas.addAll(List.generate(20, (index){
          return "extra ${datas.length+1}";
        }));
      });
    });

  }

//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      backgroundColor: Colors.white,
//      body: Container(
//        child: GridView.extent(
//          maxCrossAxisExtent: MediaQuery
//              .of(context)
//              .size
//              .width / 3,
//          scrollDirection: Axis.vertical,
//          childAspectRatio: 0.7,
//          mainAxisSpacing: 10,
//          crossAxisSpacing: 5,
//          children: List.generate(datas.length, (index) {
//            return Container(
//              color: Colors.orangeAccent,
//              alignment: Alignment.center,
//              child: Text(datas[index]),
//            );
//          }),),
//      ),
//    );
//  }

//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      backgroundColor: Colors.white,
//      body: Container(
//        child: GridView(
//          scrollDirection: Axis.vertical,
////          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
//////            maxCrossAxisExtent: 150, //子控件最大宽度为100
//////          childAspectRatio: 0.5,//宽高比为1:2
////            maxCrossAxisExtent: MediaQuery.of(context).size.width / 4,
////            mainAxisSpacing: 5,
////            crossAxisSpacing: 5,
////          ),
//        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//          crossAxisCount: 3,//一行显示6个，控件自己适应匹配
//          mainAxisSpacing: 5.0,//主轴控件之间的间隔
//          crossAxisSpacing: 10.0,//副轴控件之间的间隔
//          childAspectRatio: 0.5,//宽高比
//        ),
//          padding: EdgeInsets.all(10.0),
//          children: List.generate(datas.length, (index) {
//            return Container(
//              color: Colors.orangeAccent,
//              alignment: Alignment.center,
//              child: Text(datas[index]),
//            );
//          }),
//        ),
//      ),
//    );
//  }

}
