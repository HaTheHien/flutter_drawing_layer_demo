import 'package:drawing/widget/bottom_bar.dart';
import 'package:drawing/widget/custom_painter.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: InkWell(
        //   onTap: () {
        //     Navigator.pop(context);
        //   },
        //   child: Container(
        //     padding: const EdgeInsets.symmetric(horizontal: 16),
        //     alignment: Alignment.center,
        //     child: const Icon(Icons.close),
        //   ),
        // ),
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
