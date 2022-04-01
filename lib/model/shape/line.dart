import 'package:drawing/model/shape/shape.dart';
import 'package:flutter/material.dart';

class Line extends Shape {
  Offset? start;
  Offset? end;

  Paint currentPaint = Paint()
    ..color = Colors.black
    ..strokeCap = StrokeCap.round
    ..strokeWidth = 10;

  Line(this.currentPaint);

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
      canvas.drawLine(start!, end!, currentPaint);
    }
  }

  @override
  void setPaint(Paint newPaint) {
    currentPaint = newPaint;
  }

  @override
  Shape init() {
    return Line(currentPaint);
  }

  @override
  bool isRemoveUpdate() {
    return true;
  }
}
