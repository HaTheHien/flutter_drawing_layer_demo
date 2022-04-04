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
    final pacmanRadius = min(size.width / 3.5, size.height / 3.5);

    final centerOffset = Offset(size.width / 2, size.height / 2);

    final pacmanPaint = Paint()
      ..shader = const RadialGradient(
        colors: [
          Color(0xFFFFFFFF),
          Color(0xFF999999),
        ],
        center: Alignment.centerLeft,
        radius: 1,
        // focalRadius: 0.7,
        // stops: [0.05, 1],
      ).createShader(
        Rect.fromCenter(
          center: centerOffset,
          width: pacmanRadius * 2,
          height: pacmanRadius * 2,
        ),
      );

    const pacmanMouthAngleDegree = 45;
    const pacmanMouthStartAngle = pacmanMouthAngleDegree * pi / 180;
    const pacmanMouthSweepAngle =
        2 * pi - pacmanMouthAngleDegree * 2 * pi / 180;

    final pacmanShadowPath = Path()
      ..moveTo(size.width / 2, size.height / 2)
      ..arcTo(
        Rect.fromCenter(
          center: centerOffset.translate(8, 0),
          width: pacmanRadius * 2,
          height: pacmanRadius * 2,
        ),
        pacmanMouthStartAngle, // radian
        pacmanMouthSweepAngle,
        false,
      )
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
      ..drawShadow(pacmanShadowPath, Colors.black, 20, false)
      ..drawArc(
        Rect.fromCenter(
          center: centerOffset,
          width: pacmanRadius * 2,
          height: pacmanRadius * 2,
        ),
        pacmanMouthStartAngle, // radian
        pacmanMouthSweepAngle,
        true,
        pacmanPaint,
      );
    // ..drawPath(pacmanPath, pacmanPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
