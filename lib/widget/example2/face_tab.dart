import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FaceTab extends StatelessWidget {
  const FaceTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: loadUiImage('assets/Lenna.png'),
      builder: (BuildContext context, AsyncSnapshot<ui.Image> snapshot) {
        if (snapshot.data != null) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: FittedBox(
              child: SizedBox(
                width: 512,
                height: 512,
                child: CustomPaint(
                  size: const Size(512, 512),
                  painter: FacePainter(snapshot.requireData),
                ),
              ),
            ),
          );
        }
        return const Center(child: LinearProgressIndicator());
      },
    );
  }
}

class FacePainter extends CustomPainter {
  final ui.Image image;

  FacePainter(this.image) : super();

  @override
  void paint(Canvas canvas, Size size) async {
    final paint = Paint()
      ..strokeCap = StrokeCap.round
      ..color = Colors.red
      ..strokeWidth = 8
      ..style = PaintingStyle.stroke;

    final facePosition = Rect.fromCenter(
      center: (const Offset(512, 512) / 2).translate(20, 32),
      width: 200,
      height: 200,
    );

    canvas
      ..drawColor(Colors.blue, BlendMode.src)
      ..drawImage(image, Offset.zero, paint)
      ..drawRect(facePosition, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// Load image from assets
Future<ui.Image> loadUiImage(String imageAssetPath) async {
  final ByteData data = await rootBundle.load(imageAssetPath);
  final Completer<ui.Image> completer = Completer();
  ui.decodeImageFromList(
    Uint8List.view(data.buffer),
    (ui.Image img) => completer.complete(img),
  );
  return completer.future;
}
