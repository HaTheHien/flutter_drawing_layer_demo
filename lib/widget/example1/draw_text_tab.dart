import 'package:flutter/material.dart';

class DrawTextTab extends StatelessWidget {
  const DrawTextTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(double.infinity, double.infinity),
      painter: DemoTextPainter(),
    );
  }
}

class DemoTextPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    TextPainter(
      text: const TextSpan(
        text: 'Hello world',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.indigo,
          fontSize: 32,
        ),
      ),
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
      maxLines: 1,
    )
      ..layout(minWidth: size.width, maxWidth: size.width)
      ..paint(canvas, Offset(0, size.height / 2));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
