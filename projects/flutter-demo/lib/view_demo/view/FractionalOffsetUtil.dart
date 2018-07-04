import 'package:flutter/material.dart';

/// LinearGradient 线性渐变封装
/// 一共有12种组合方式
/// 用法：在有gradient属性的地方使用:例如：
/// gradient: setFractionalOffsets(Type.leftBottomToRightTop, null),
/// 再例如：
/// gradient: setFractionalOffsets(Type.leftToRight, Direction.firstDirection),
LinearGradient setFractionalOffsets(
    @required Types type, @required Direction direction) {
  LinearGradient linearGradient;

  if (type == Types.leftToRight) {
    linearGradient =
        DirectionStyle2(direction, 0.0, 0.0, 1.0, 0.0, 0.0, 1.0, 1.0, 1.0);
  } else if (type == Types.rightToLeft) {
    linearGradient =
        DirectionStyle2(direction, 1.0, 0.0, 0.0, 0.0, 1.0, 1.0, 0.0, 1.0);
  } else if (type == Types.topToBottom) {
    linearGradient =
        DirectionStyle2(direction, 0.0, 0.0, 0.0, 1.0, 1.0, 0.0, 1.0, 1.0);
  } else if (type == Types.bottomToTop) {
    linearGradient =
        DirectionStyle2(direction, 0.0, 1.0, 0.0, 0.0, 1.0, 1.0, 0.0, 0.0);
  } else if (type == Types.leftTopToRightBottom) {
    linearGradient = DirectionStyle(0.0, 0.0, 1.0, 1.0);
  } else if (type == Types.rightBottomToLeftTop) {
    linearGradient = DirectionStyle(1.0, 1.0, 0.0, 0.0);
  } else if (type == Types.rightTopToLeftBottom) {
    linearGradient = DirectionStyle(1.0, 0.0, 0.0, 1.0);
  } else if (type == Types.leftBottomToRightTop) {
    linearGradient = DirectionStyle(0.0, 1.0, 1.0, 0.0);
  }
  return linearGradient;
}

LinearGradient DirectionStyle(
    double startX, double startY, double endX, double endY) {
  return DirectionStyle2(
      null, startX, startY, endX, endY, -1.0, -1.0, -1.0, -1.0);
}

// Dart语法不允许有相同的方法名，没有方法重载的概念
LinearGradient DirectionStyle2(
    @required Direction direction,
    double startX,
    double startY,
    double endX,
    double endY,
    double startX2,
    double startY2,
    double endX2,
    double endY2) {
  direction == Direction.firstDirection ? startX = startX : startX2;
  direction == Direction.firstDirection ? startY = startY : startY2;
  direction == Direction.firstDirection ? endX = endX : endX2;
  direction == Direction.firstDirection ? endY = endY : endY2;

  var linearGradient = new LinearGradient(
    //线性渐变
    begin: FractionalOffset(startX, startY),
    end: FractionalOffset(endX, endY),
    colors: <Color>[Colors.purple[300], Colors.blue[500]],
  );
  return linearGradient;
}

// 因为从上到下，或者从左到右 都有两种可能。
// 从上到下 包括： 左上 -> 左下   右上 -> 右下
// 从左到右 包括： 左上 -> 右上   左下 -> 右下
enum Direction {
  firstDirection, //如果是从上到下： 左上 -> 左下，如果是从左到右：左上 -> 右上
  lastPointDirection, // 如果是从上到下： 右上 -> 右下，如果是从左到右：左下 -> 右下
}

enum Types {
  //8个方向
  leftToRight, //→
  rightToLeft, //←
  topToBottom, //↓
  bottomToTop, //↑
  leftTopToRightBottom, //↘
  rightBottomToLeftTop, //↖
  rightTopToLeftBottom, //↙
  leftBottomToRightTop, //↗
}
