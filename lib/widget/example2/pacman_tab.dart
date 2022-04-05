import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
  double _getPacmanRadius(Size size) => size.shortestSide / 3.5;

  /// Create a rectangle representing the bound of pacman shape from given
  /// size and center offset.
  ///
  /// @param size the size of canvas
  /// @param center given center, if the value is null, the center vlaue of
  /// size is used.
  ///
  /// @return Rect object
  Rect _getPacmanRect(Size size, {Offset? center}) {
    final Offset pacmanOffset;
    if (center == null) {
      pacmanOffset = Offset(size.width / 2, size.height / 2);
    } else {
      pacmanOffset = center;
    }

    return Rect.fromCircle(
      center: pacmanOffset,
      radius: _getPacmanRadius(size),
    );
  }

  @override
  void paint(Canvas canvas, Size size) {
    final foregroundPaint = Paint()
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.fill
      ..color = const Color(0xFF383838);

    final backgroundRadius = min(size.width / 2, size.height / 2);
    final centerOffset = Offset(size.width / 2, size.height / 2);

    final pacmanPaint = Paint()
      ..shader = const RadialGradient(
        colors: [
          Color(0xFFFFFFFF),
          Color(0xFF999999),
        ],
        center: Alignment.centerLeft,
        radius: 1,
      ).createShader(_getPacmanRect(size));

    const pacmanMouthAngleDegree = 45;
    const pacmanMouthStartAngle = pacmanMouthAngleDegree * pi / 180;
    const pacmanMouthSweepAngle =
        2 * pi - pacmanMouthAngleDegree * 2 * pi / 180;

    final pacmanShadowPath = Path()
      ..moveTo(size.width / 2, size.height / 2)
      ..arcTo(
        _getPacmanRect(size, center: centerOffset.translate(8, 0)),
        pacmanMouthStartAngle, // radian
        pacmanMouthSweepAngle,
        false,
      )
      ..close();

    canvas
      ..drawCircle(
        centerOffset,
        backgroundRadius,
        foregroundPaint,
      )
      // ..drawCircle(
      //   centerOffset,
      //   pacmanRadius,
      //   pacmanPaint,
      // );
      ..drawShadow(pacmanShadowPath, Colors.black, 20, true)
      ..drawArc(
        _getPacmanRect(size),
        pacmanMouthStartAngle, // radian
        pacmanMouthSweepAngle,
        true,
        pacmanPaint,
      );
    // ..drawPath(pacmanPath, pacmanPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(covariant CustomPainter oldDelegate) => false;

  @override
  SemanticsBuilderCallback? get semanticsBuilder => (Size size) {
        final pacmanRect = _getPacmanRect(size);
        return <CustomPainterSemantics>[
          CustomPainterSemantics(
            rect: pacmanRect,
            properties: const SemanticsProperties(
              label: 'Pacman',
              textDirection: TextDirection.ltr,
            ),
          ),
        ];
      };
}
