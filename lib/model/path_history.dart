import 'dart:ui';

import 'package:drawing/model/list_point.dart';
import 'package:drawing/model/shape/circle.dart';
import 'package:drawing/model/shape/noShape.dart';
import 'package:drawing/model/shape/oval.dart';
import 'package:drawing/model/shape/rect.dart';
import 'package:drawing/model/shape/shape.dart';
import 'package:flutter/material.dart';

class PathHistory {
  late List<Shape> _paths;
  late Paint currentPaint;
  late Paint _backgroundPaint;
  late bool _inDrag;
  late Shape currentShape;

  PathHistory() {
    _paths = [];
    _inDrag = false;
    _backgroundPaint = Paint()
      ..color = Colors.white
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 10;
    currentPaint = Paint()
      ..color = Colors.black
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 10;
    currentShape = NoShape(currentPaint);
  }

  void setCurrentShape(Shape newShape) {
    currentShape = newShape;
  }

  void setBackgroundColor(Color backgroundColor) {
    _backgroundPaint.color = backgroundColor;
  }

  void setDrawColor(Color drawColor) {
    currentPaint.color = drawColor;
  }

  void undo() {
    if (!_inDrag) {
      _paths.removeLast();
    }
  }

  void clear() {
    if (!_inDrag) {
      _paths.clear();
    }
  }

  void add(Offset startPoint) {
    if (!_inDrag) {
      _inDrag = true;
      currentShape.add(startPoint);
      _paths.add(currentShape);
    }
  }

  void updateCurrent(Offset nextPoint) {
    if (_inDrag) {
      if (currentShape.isRemoveUpdate()) {
        _paths.removeLast();
      }
      currentShape.updateCurrent(nextPoint);
      _paths.add(currentShape);
    }
  }

  void endCurrent() {
    _inDrag = false;
    currentShape.endCurrent();
    currentShape = currentShape.init();
  }

  void draw(Canvas canvas, Size size) {
    // restart screen
    canvas.drawRect(
        Rect.fromLTWH(0.0, 0.0, size.width, size.height), _backgroundPaint);

    // draw all again (use in undo)
    for (var element in _paths) {
      element.draw(canvas);
    }
  }
}
