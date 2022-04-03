import 'package:flutter/material.dart';

class DrawRectTab extends StatelessWidget {
  const DrawRectTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(double.infinity, double.infinity),
      painter: RectPainter(),
    );
  }
}

class RectPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.indigo
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 10;

    canvas.drawRect(
      Rect.fromLTRB(
        size.width * 1 / 6,
        size.height * 1 / 4,
        size.width * 5 / 6,
        size.height * 3 / 4,
      ),
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
