import 'package:flutter/material.dart';
import 'dart:math' as math;

class FlowerPainter extends CustomPainter {
  final Color color;

  FlowerPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = math.min(size.width, size.height) / 2;

    for (int i = 0; i < 5; i++) {
      final angle = (i * 2 * math.pi / 5) - math.pi / 2;
      final petalCenter = Offset(
        center.dx + radius * 0.7 * math.cos(angle),
        center.dy + radius * 0.7 * math.sin(angle),
      );
      canvas.drawCircle(petalCenter, radius * 0.5, paint);
    }

    canvas.drawCircle(center, radius * 0.3, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class HeartPainter extends CustomPainter {
  final Color color;

  HeartPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(size.width / 2, size.height / 5);
    path.cubicTo(
      size.width / 2,
      size.height / 8,
      size.width / 4,
      0,
      0,
      size.height / 4,
    );
    path.cubicTo(
      0,
      size.height / 2,
      size.width / 2,
      size.height * 3 / 4,
      size.width / 2,
      size.height,
    );
    path.cubicTo(
      size.width / 2,
      size.height * 3 / 4,
      size.width,
      size.height / 2,
      size.width,
      size.height / 4,
    );
    path.cubicTo(
      size.width * 3 / 4,
      0,
      size.width / 2,
      size.height / 8,
      size.width / 2,
      size.height / 5,
    );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
