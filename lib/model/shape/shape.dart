import 'dart:ui';

import 'package:flutter/material.dart';

class Shape {
  void add(Offset startPoint) {}

  void updateCurrent(Offset nextPoint) {}

  void endCurrent() {}

  void draw(Canvas canvas) {}

  void setPaint(Paint newPaint) {}

  Shape init() {
    return Shape();
  }
}
