import 'package:flutter/material.dart';

class DrawCurve2Tab extends StatelessWidget {
  const DrawCurve2Tab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(double.infinity, double.infinity),
      painter: CurvePainter(),
    );
  }
}

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.indigo
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 10;

    final path = Path()
      ..moveTo(size.width, 0)
      ..cubicTo(
        size.width,
        size.height,
        0,
        0,
        0,
        size.height,
      );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
