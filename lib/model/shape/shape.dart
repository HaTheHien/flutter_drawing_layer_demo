import 'package:drawing/model/list_point.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

class Shape {
  void add(Offset startPoint) {}

  void updateCurrent(Offset nextPoint) {}

  void endCurrent() {}

  void draw(Canvas canvas) {}

  void setPaint(Paint newPaint) {}

  Shape init() {
    return Shape();
  }

  bool isRemoveUpdate() {
    return false;
  }
}
