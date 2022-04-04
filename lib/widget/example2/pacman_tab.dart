import 'dart:math';

import 'package:flutter/material.dart';

class PacmanTab extends StatelessWidget {
  const PacmanTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: CustomPaint(
        size: const Size(double.infinity, double.infinity),
        painter: PacmanPainter(),
      ),
    );
  }
}

class PacmanPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final foregroundPaint = Paint()
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.fill
      ..color = const Color(0xFF383838);

    final radius = min(size.width / 2, size.height / 2);
    final pacmanRadius = min(size.width / 4, size.height / 4);

    final centerOffset = Offset(size.width / 2, size.height / 2);

    final pacmanPaint = Paint()
      ..shader = const RadialGradient(
        colors: [
          Color(0xFFFFFFFF),
          Color(0xFF999999),
        ],
        center: Alignment(0, 0.25),
        radius: 1,
      ).createShader(
        Offset.zero & (size / 2),
      );

    const pacmanMouthAngleDegree = 45;

    final pacmanShadowPath = Path()
      ..moveTo(size.width / 2, size.height / 2)
      ..arcTo(
          Rect.fromCenter(
            center: centerOffset.translate(8, 0),
            width: pacmanRadius * 2 + 8,
            height: pacmanRadius * 2 + 8,
          ),
          pacmanMouthAngleDegree * pi / 180, // radian
          2 * pi - pacmanMouthAngleDegree * 2 * pi / 180,
          false)
      ..close();

    canvas
      ..drawCircle(
        centerOffset,
        radius,
        foregroundPaint,
      )
      // ..drawCircle(
      //   centerOffset,
      //   pacmanRadius,
      //   pacmanPaint,
      // );
      ..drawShadow(pacmanShadowPath, Colors.black, 8, false)
      ..drawArc(
        Rect.fromCenter(
          center: centerOffset,
          width: pacmanRadius * 2,
          height: pacmanRadius * 2,
        ),
        45 * pi / 180, // radian
        2 * pi - 90 * pi / 180,
        true,
        pacmanPaint,
      );
    // ..drawPath(pacmanPath, pacmanPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
