import 'dart:math';

import 'package:drawing/model/shape/shape.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

class Circle extends Shape {
  Offset? start;
  Offset? end;

  Paint currentPaint = Paint()
    ..color = Colors.black
    ..strokeCap = StrokeCap.round
    ..strokeWidth = 10;

  Circle(this.currentPaint);

  @override
  void add(Offset startPoint) {
    start = startPoint;
    end = startPoint;
  }

  @override
  void updateCurrent(Offset nextPoint) {
    end = nextPoint;
  }

  @override
  void endCurrent() {}

  @override
  void draw(Canvas canvas) {
    if (start != null && end != null) {
      double distance =
          sqrt(pow(start!.dx - end!.dx, 2) + pow(start!.dy - end!.dy, 2));
      canvas.drawCircle(start!, distance, currentPaint);
    }
  }

  @override
  Shape init() {
    return Circle(currentPaint);
  }

  @override
  bool isRemoveUpdate() {
    return true;
  }
}
