import 'dart:math';

import 'package:drawing/model/shape/shape.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

class Oval extends Shape {
  Offset? start;
  Offset? end;

  Paint currentPaint = Paint()
    ..color = Colors.black
    ..strokeCap = StrokeCap.round
    ..strokeWidth = 10;

  Oval(this.currentPaint);

  @override
  void add(Offset startPoint) {
    start = startPoint;
    end = startPoint;
  }

  @override
  void setPaint(Paint newPaint) {
    currentPaint = newPaint;
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
      canvas.drawOval(Rect.fromPoints(start!, end!), currentPaint);
    }
  }

  @override
  Shape init() {
    return Oval(currentPaint);
  }
}
