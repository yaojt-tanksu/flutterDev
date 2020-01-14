import 'package:flutter/material.dart';

class WidgetDecoration {
  Widget _widget;

  WidgetDecoration(this._widget);

  Function _onTapFunc;
  Function _onDoubleTabFunc;
  Function _onLongPressFunc;

  Widget build() {
    return _widget;
  }

  ///点击事件
  WidgetDecoration onClick({Key key, onTap, onDoubleTap, onLongPress}) {
    _widget = GestureDetector(
      key: key,
      child: _widget,
      onTap: onTap ?? _onTapFunc,
      onDoubleTap: onDoubleTap ?? _onDoubleTabFunc,
      onLongPress: onLongPress ?? _onLongPressFunc,
    );
    return this;
  }

  ///添加点击事件
  WidgetDecoration onTag(Function func, {Key key}) {
    _onTapFunc = func;
    _widget = GestureDetector(
      key: key,
      child: _widget,
      onTap: _onTapFunc,
      onDoubleTap: _onDoubleTabFunc,
      onLongPress: _onLongPressFunc,
    );
    return this;
  }

  ///添加点击事件
  WidgetDecoration onDoubleTap(Function func, {Key key}) {
    _onDoubleTabFunc = func;
    _widget = GestureDetector(
      key: key,
      child: _widget,
      onTap: _onTapFunc,
      onDoubleTap: _onDoubleTabFunc,
      onLongPress: _onLongPressFunc,
    );
    return this;
  }

  ///添加点击事件
  WidgetDecoration onLongPress(Function func, {Key key}) {
    _onLongPressFunc = func;
    _widget = GestureDetector(
      key: key,
      child: _widget,
      onTap: _onTapFunc,
      onDoubleTap: _onDoubleTabFunc,
      onLongPress: _onLongPressFunc,
    );
    return this;
  }

  ///add padding属性
  WidgetDecoration paddingAll({Key key, double all = 0.0}) {
    var padding = EdgeInsets.all(all);
    _widget = Padding(
      key: key,
      padding: padding,
      child: _widget,
    );
    return this;
  }

  ///add padding属性
  WidgetDecoration padding(
      {Key key,
      double left = 0.0,
      double top = 0.0,
      double right = 0.0,
      double bottom = 0.0}) {
    var padding =
        EdgeInsets.only(left: left, top: top, right: right, bottom: bottom);

    _widget = Padding(
      key: key,
      padding: padding,
      child: _widget,
    );
    return this;
  }

  ///增加align 当前布局相对位置
  ///FractionalOffset.centerRight
  WidgetDecoration align(
      {Key key, AlignmentGeometry alignment = Alignment.center}) {
    _widget = Align(
      key: key,
      alignment: alignment,
      child: _widget,
    );
    return this;
  }

  ///位置布局
  WidgetDecoration positioned(
      {Key key,
      double left,
      double top,
      double right,
      double bottom,
      double width,
      double height}) {
    _widget = Positioned(
        key: key,
        left: left,
        top: top,
        right: right,
        bottom: bottom,
        width: width,
        height: height);
    return this;
  }

  ///填充布局
  WidgetDecoration expanded({Key key, int flex = 1}) {
    _widget = Expanded(
      key: key,
      flex: flex,
      child: _widget,
    );
    return this;
  }

  ///是否显示布局 true为不显示 false为显示
  WidgetDecoration offstage({Key key, bool offstage = true}) {
    _widget = Offstage(
      key: key,
      offstage: offstage,
      child: _widget,
    );
  }

  ///透明度 0 是完全透明 1 完全不透明
  WidgetDecoration opacity(
      {Key key, @required double opacity, alwaysIncludeSemantics = true}) {
    _widget = Opacity(
      key: key,
      opacity: opacity,
      alwaysIncludeSemantics: alwaysIncludeSemantics,
      child: _widget,
    );
  }

  ///基准线布局
  WidgetDecoration baseLine(
      {Key key,
      @required double baseLine,
      @required TextBaseline baseLineType}) {
    _widget = Baseline(
      key: key,
      baseline: baseLine,
      baselineType: baseLineType,
      child: _widget,
    );
    return this;
  }

  ///设置宽高比
  WidgetDecoration aspectRatio({Key key, @required double aspectRatio}) {
    _widget = AspectRatio(
      key: key,
      aspectRatio: aspectRatio,
    );
    return this;
  }

  ///矩阵转换
  WidgetDecoration transform(
      {Key key, Matrix4 matrix4, origin, alignment, transformHitTests = true}) {
    _widget = Transform(
      key: key,
      transform: matrix4,
      origin: origin,
      alignment: alignment,
      transformHitTests: transformHitTests,
      child: _widget,
    );
    return this;
  }

  ///居中  center
  WidgetDecoration center({Key key, double widthFactor, double heightFactor}) {
    _widget = Center(
      key: key,
      widthFactor: widthFactor,
      heightFactor: heightFactor,
    );
    return this;
  }

  ///布局容器
  WidgetDecoration container(
      {Key key,
      alignment,
      padding,
      Color color,
      Decoration decoration,
      foregroundDecoration,
      double width,
      double height,
      BoxConstraints constraints,
      margin,
      transform,
      Widget parent}) {
    _widget = Container(
      key: key,
      alignment: alignment,
      padding: padding,
      color: color,
      decoration: decoration,
      foregroundDecoration: foregroundDecoration,
      width: width,
      height: height,
      constraints: constraints,
      margin: margin,
      transform: transform,
      child: _widget,
    );
    return this;
  }

  ///设置具体尺寸
  WidgetDecoration sizedBox({Key key, double width, double height}) {
    _widget = SizedBox(
      key: key,
      width: width,
      height: height,
      child: _widget,
    );
    return this;
  }

  ///设置最大最小宽高布局
  WidgetDecoration constrainedBox(
      {Key key,
      minWidth = 0.0,
      maxWidth = double.infinity,
      minHeight = 0.0,
      maxHeight = double.infinity}) {
    BoxConstraints boxConstraints = BoxConstraints(
        minWidth: minWidth,
        maxWidth: maxWidth,
        minHeight: minHeight,
        maxHeight: maxHeight);
    _widget = ConstrainedBox(
      key: key,
      constraints: boxConstraints,
      child: _widget,
    );
    return this;
  }

  ///限定最大宽高布局
  WidgetDecoration linitedBox(
      {Key key,
      double maxWidth = double.infinity,
      maxHeight = double.infinity}) {
    _widget = LimitedBox(
      key: key,
      maxWidth: maxWidth,
      maxHeight: maxHeight,
    );
    return this;
  }

  ///百分比布局
  WidgetDecoration fractionallySizedBox(
      {Key key,
      alignment = Alignment.center,
      double widthFactor,
      double heightFactor}) {
    _widget = FractionallySizedBox(
      key: key,
      alignment: alignment,
      widthFactor: widthFactor,
      heightFactor: heightFactor,
      child: _widget,
    );
    return this;
  }

  ///缩放布局
  WidgetDecoration fittedBox(
      {Key key, fit = BoxFit.contain, alignment = Alignment.center}) {
    _widget = FittedBox(
      key: key,
      fit: fit,
      alignment: alignment,
      child: _widget,
    );
    return this;
  }

  ///旋转盒子 1次是90度
  WidgetDecoration rotatedBox({Key key, @required int quarterTurns}) {
    _widget = RotatedBox(
      key: key,
      quarterTurns: quarterTurns,
      child: _widget,
    );
    return this;
  }

  ///装饰盒子 细节往外抛 decoration 编写放在外面
  WidgetDecoration decorationBox(
      {Key key,
      @required Decoration decoration,
      position = DecorationPosition.background}) {
    _widget = DecoratedBox(
      key: key,
      decoration: decoration,
      position: position,
      child: _widget,
    );
    return this;
  }

  ///圆形剪裁
  WidgetDecoration clipOval(
      {Key key,
      CustomClipper<Rect> clipper,
      Clip clipBehavior = Clip.antiAlias}) {
    _widget = ClipOval(
      key: key,
      clipper: clipper,
      clipBehavior: clipBehavior,
      child: _widget,
    );
    return this;
  }

  ///圆角矩形剪裁
  WidgetDecoration clipRRect(
      {Key key,
      @required BorderRadius borderRadius,
      CustomClipper<RRect> clipper,
      Clip clipBehavior = Clip.antiAlias}) {
    _widget = new ClipRRect(
        key: key,
        borderRadius: borderRadius,
        clipper: clipper,
        clipBehavior: clipBehavior,
        child: _widget);
    return this;
  }

  ///矩形剪裁  todo: 需要自定义clipper 否则无效果
  WidgetDecoration clipRect(
      {Key key,
      @required CustomClipper<Rect> clipper,
      Clip clipBehavior = Clip.antiAlias}) {
    _widget = ClipRect(
      key: key,
      clipper: clipper,
      clipBehavior: clipBehavior,
      child: _widget,
    );
    return this;
  }

  ///路径剪裁  todo: 需要自定义clipper 否则无效果
  WidgetDecoration clipPath(
      {Key key,
      @required CustomClipper<Path> clipper,
      Clip clipBehavior = Clip.antiAlias}) {
    _widget = ClipPath(
      key: key,
      child: _widget,
      clipBehavior: clipBehavior,
      clipper: clipper,
    );
    return this;
  }

  ///animatedOpacity 淡入淡出
  WidgetDecoration animatedOpcity(
      {Key key,
      @required double opacity,
      Curve curve = Curves.linear,
      @required Duration duration}) {
    _widget = AnimatedOpacity(
      key: key,
      opacity: opacity,
      curve: curve,
      duration: duration,
      child: _widget,
    );
    return this;
  }

  ///页面简单切换效果
  WidgetDecoration hero({Key key, @required Object obj}) {
    _widget = Hero(
      key: key,
      tag: obj,
      child: _widget,
    );
    return this;
  }
}
