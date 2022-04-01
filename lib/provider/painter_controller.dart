import 'package:drawing/model/path_history.dart';
import 'package:drawing/model/shape/shape.dart';
import 'package:flutter/material.dart';

class PainterController extends ChangeNotifier {
  Color _drawColor = Colors.yellow;
  Color _backgroundColor = new Color.fromARGB(255, 255, 255, 255);

  double _thickness = 1.0;
  late PathHistory _pathHistory;
  late ValueGetter<Size> _widgetFinish;

  PainterController() {
    _pathHistory = PathHistory();
  }

  Color get drawColor => _drawColor;

  PathHistory get getPathHistory => _pathHistory;

  set drawColor(Color color) {
    _drawColor = color;
    _updatePaint();
  }

  Color get backgroundColor => _backgroundColor;

  set backgroundColor(Color color) {
    _backgroundColor = color;
    _updatePaint();
  }

  double get thickness => _thickness;

  set thickness(double t) {
    _thickness = t;
    _updatePaint();
  }

  set shape(Shape newShape) {
    _pathHistory.setCurrentShape(newShape);
  }

  Paint getCurrentPaint() {
    Paint paint = Paint();
    paint.color = drawColor;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = thickness;
    return paint;
  }

  void _updatePaint() {
    Paint paint = getCurrentPaint();
    _pathHistory.currentPaint = paint;
    _pathHistory.setBackgroundColor(backgroundColor);
    notifyListeners();
  }

  void undo() {
    _pathHistory.undo();
    notifyListeners();
  }

  void updateNotifyListeners() {
    notifyListeners();
  }

  void clear() {
    _pathHistory.clear();
    notifyListeners();
  }
}
