import 'package:drawing/model/list_point.dart';
import 'package:drawing/model/shape/shape.dart';
import 'package:flutter/material.dart';

class NoShape extends Shape {
  final ListPoint _paths = ListPoint();

  Paint currentPaint = Paint()
    ..color = Colors.black
    ..strokeCap = StrokeCap.round
    ..strokeWidth = 10;

  NoShape(this.currentPaint);

  @override
  void add(Offset startPoint) {
    _paths.add(startPoint);
  }

  @override
  void updateCurrent(Offset nextPoint) {
    _paths.add(nextPoint);
  }

  @override
  void endCurrent() {}

  @override
  void draw(Canvas canvas) {
    Offset? temp;
    for (var element in _paths.getList) {
      if (temp == null) {
        temp = element;
      } else {
        canvas.drawLine(temp, element, currentPaint);
        temp = element;
      }
    }
  }

  @override
  void setPaint(Paint newPaint) {
    currentPaint = newPaint;
  }

  @override
  Shape init() {
    return NoShape(currentPaint);
  }
}
