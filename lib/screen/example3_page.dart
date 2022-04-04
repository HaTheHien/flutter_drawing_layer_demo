import '../widget/example_3/bottom_bar.dart';
import '../widget/example_3/custom_painter.dart';
import 'package:flutter/material.dart';

class Example3Page extends StatelessWidget {
  const Example3Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Draw",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
      backgroundColor: Colors.grey,
      body: SafeArea(
        child: LayoutBuilder(builder: (context, constraints) {
          return Column(
            children: [
              RepaintBoundary(
                child: SizedBox(
                  height: constraints.maxHeight - 80,
                  child: const Painter(),
                ),
              ),
              const BottomToolBar(),
            ],
          );
        }),
      ),
    );
  }
}
