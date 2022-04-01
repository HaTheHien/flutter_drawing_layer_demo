import 'package:flutter/material.dart';
import 'dart:ui';

class ListPoint {
  List<Offset> list = [];
  ListPoint();
  void add(Offset a) {
    list.add(a);
  }

  List<Offset> get getList => list;
}
