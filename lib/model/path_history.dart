import 'dart:ui';

import 'package:drawing/model/list_point.dart';
import 'package:flutter/material.dart';

class PathHistory {
  late List<MapEntry<ListPoint, Paint>> _paths;
  late Paint currentPaint;
  late Paint _backgroundPaint;
  late bool _inDrag;

  PathHistory() {
    _paths = <MapEntry<ListPoint, Paint>>[];
    _inDrag = false;
    _backgroundPaint = Paint()
      ..color = Colors.white
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 10;
    currentPaint = Paint()
      ..color = Colors.black
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 10;
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
      ListPoint list = ListPoint();
      list.add(startPoint);
      _paths.add(MapEntry<ListPoint, Paint>(list, currentPaint));
    }
  }

  void updateCurrent(Offset nextPoint) {
    if (_inDrag) {
      ListPoint list = _paths.last.key;
      list.add(nextPoint);
    }
  }

  void endCurrent() {
    _inDrag = false;
  }

  void draw(Canvas canvas, Size size) {
    // restart screen
    canvas.drawRect(
        Rect.fromLTWH(0.0, 0.0, size.width, size.height), _backgroundPaint);

    // draw all again (use in undo)
    for (MapEntry<ListPoint, Paint> path in _paths) {
      Offset? temp;
      for (var element in path.key.getList) {
        if (temp == null) {
          temp = element;
        } else {
          canvas.drawLine(temp, element, path.value);
          temp = element;
        }
      }
    }
  }
}
