import 'package:flutter/material.dart';

import '../widget/example4/example4_view.dart';

class Example4Page extends StatelessWidget {
  const Example4Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Drawing with animation')),
      body: const SafeArea(
        child: Example4View(),
      ),
    );
  }
}
