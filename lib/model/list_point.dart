import 'dart:ui';

import 'package:flutter/material.dart';

class ListPoint {
  List<Offset> list = [];
  ListPoint();
  void add(Offset a) {
    list.add(a);
  }

  List<Offset> get getList => list;
}
