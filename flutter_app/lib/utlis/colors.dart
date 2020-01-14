
import 'dart:math';
import 'package:flutter/material.dart';

class ColorConstance{
  Color c1 = Color(0xFF3CAAFA);
  Color c2 = Color.fromRGBO(60, 170, 250, 1);
  Color c3 = Color.fromARGB(255, 60, 170, 250);
  Color c5 = Colors.blue;
}


class ColorsUtil {
  /// 十六进制颜色，
  /// hex, 十六进制值，例如：0xffffff,
  /// alpha, 透明度 [0.0,1.0]
  /// 使用示例
  /// ColorsUtil.hexColor(0x3caafa)//透明度为1
  /// ColorsUtil.hexColor(0x3caafa,alpha: 0.5)//透明度为0.5
  static Color hexColor(int hex, {double alpha = 1}) {
    if (alpha < 0) {
      alpha = 0;
    } else if (alpha > 1) {
      alpha = 1;
    }
    return Color.fromRGBO((hex & 0xFF0000) >> 16, (hex & 0x00FF00) >> 8,
        (hex & 0x0000FF) >> 0, alpha);
  }

  static Color randomColor(){
    int int1=Random().nextInt(99);
    print("randomColor:$int1");
    return Color.fromARGB(int1, 24, 102, 98);
  }
}
