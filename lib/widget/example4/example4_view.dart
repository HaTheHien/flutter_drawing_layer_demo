import 'dart:math';

import 'package:flutter/material.dart';

class Example4View extends StatefulWidget {
  const Example4View({Key? key}) : super(key: key);

  @override
  State<Example4View> createState() => _Example4ViewState();
}

class _Example4ViewState extends State<Example4View>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Center(
      child: CustomPaint(
        painter: CirclePainter(
          animationController,
          color: Colors.red,
        ),
        child: SizedBox(
          width: 2 * size.width / 3,
          height: 2 * size.height / 3,
          child: Icon(
            Icons.cell_tower,
            color: Colors.white,
            size: min(size.width, size.height) / 12,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}

class CirclePainter extends CustomPainter {
  CirclePainter(
    this.animation, {
    required this.color,
  }) : super(repaint: animation);

  final Animation<double> animation;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Rect.fromLTRB(0, 0, size.width, size.height);
    for (var wave = 3; wave >= 0; wave--) {
      drawCircle(canvas, rect, wave + animation.value);
    }
  }

  void drawCircle(Canvas canvas, Rect rect, double value) {
    final double opacity = (1 - (value / 4)).clamp(0, 1);
    final size = rect.width / 2;
    final area = size * size;
    final radius = sqrt(area * value / 4);

    final paint = Paint()..color = color.withOpacity(opacity);

    canvas.drawCircle(rect.center, radius, paint);
  }

  @override
  bool shouldRepaint(CirclePainter oldDelegate) => true;
}
