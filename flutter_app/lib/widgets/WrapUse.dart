import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WrapUse extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('wrap按宽高自动换行示例'),
      ),
      body: Wrap(
        spacing: 8.0, //chip之间的间隙大小
        runSpacing: 4.0, //行之间的间隙大小
        children: <Widget>[
          Chip(
            //添加圆形头像
//            avatar: CircleAvatar(
//              backgroundColor: Colors.lightGreen.shade800,
//              radius: 10,
//              child: Image.asset("images/logo.jpg"),
//            ),
            label: Text('武大郎脆饼'),
          ),
          Chip(
            //添加圆形头像
            onDeleted: (){
              print("ondeleted");
            },
            avatar: CircleAvatar(
              backgroundColor: Colors.lightGreen.shade700,
              child: new Text(
                '西毒',
                style: new TextStyle(
                  fontSize: 10.0,
                ),
              ),
            ),
            label: Text('东邪西毒'),
          ),
          Chip(
            //添加圆形头像
            avatar: CircleAvatar(
              backgroundColor: Colors.lightGreen.shade900,
              child: new Text(
                '杨6郎',
                style: new TextStyle(
                  fontSize: 10.0,
                ),
              ),
            ),
            label: Text('杨6郎扛枪杨6郎扛枪杨6郎扛枪'),
          ),
          Chip(
            //添加圆形头像
            avatar: CircleAvatar(
              backgroundColor: Colors.lightGreen.shade700,
              child: new Text(
                '武松',
                style: new TextStyle(
                  fontSize: 10.0,
                ),
              ),
            ),
            label: Text('武松打虎'),
          ),
        ],
      ),
    );
  }
}
