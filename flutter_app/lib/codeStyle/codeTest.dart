import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/codeStyle/WidgetDecoration.dart';

class ChainCodeWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ChainCodeWidgetBuilder();
  }
}

class ChainCodeWidgetBuilder extends State<ChainCodeWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("链式调用"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            WidgetDecoration(Text(
              "链式调用",
            ))
                .onTag(() {
                  onTag(context, true);
                })
                .onLongPress(onLongPress)
                .padding(left: 5.0)
                .build(),
            WidgetDecoration(InkWell(
              onTap: () {
                print("onclick");
              },
              child: WidgetDecoration(Text(
                "inkwell 点击事件！",
                style: TextStyle(
                  color: Colors.redAccent,
                  fontSize: 16,
                ),
              )).build(),
            ))
                .padding(top: 10.0)
                .container(margin: EdgeInsets.only(left: 10.0))
                .build(),
            WidgetDecoration(Material(
              color: Colors.purple,
              child: WidgetDecoration(InkWell(
                onTap: () {
                  print("abc");
                },
                child: WidgetDecoration(WidgetDecoration(Container(
                  child: Text(
                    "自定义水波纹点击效果，设置widget背景色",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ))
                        .container(
                          width: 300.0,
                          height: 44.0,
                          alignment: Alignment.center,
                        )
                        .build())
                    .build(),
              )).build(),
            ))
                .container(
                  margin: EdgeInsets.only(top: 12.0),
                )
                .build(),
            WidgetDecoration(WidgetDecoration(Ink(
              child: WidgetDecoration(InkWell(
                onTap: () {
                  print("自定义圆角的水波纹");
                },
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
                child: Text("自定义圆角的水波纹"),
              )).build(),
            ))
                    .decorationBox(
                        decoration: BoxDecoration(
                      color: Colors.pink,
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ))
                    .build())
                .build(),
            Material(
              child: Ink(
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.all(Radius.circular(44.0))),
                child: InkWell(
                  onTap: () {
                    print("自定义圆角的水波纹2");
                  },
                  child: WidgetDecoration(Text("自定义圆角的水波纹2"))
                      .container(
                        width: 300,
                        height: 44.0,
                        margin: EdgeInsets.only(left: 10.0),
                        alignment: Alignment.center,
                      )
                      .build(),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }

  void onTag(BuildContext context, bool isTap) {
    print("onTag $isTap");
  }

  void onLongPress() {
    print("onLongPress");
  }
}
