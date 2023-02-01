import 'package:flutter/material.dart';
import 'package:heimat/ui/utils/colors.dart';

class LinePainter1 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double width = size.width, height = size.height;

    final start = Offset((width / 100) * 50, 0);
    final end = Offset(0, (height / 100) * 15);

    final paint = Paint()
      ..color = white
      ..strokeWidth = 2;
    canvas.drawLine(start, end, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class LinePainter2 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double width = size.width, height = size.height;

    const start = Offset(0, 0);
    final end = Offset((width / 100) * 30, (height / 100) * 20);

    final paint = Paint()
      ..color = white
      ..strokeWidth = 2;
    canvas.drawLine(start, end, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class LinePainter3 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double width = size.width, height = size.height;

    const start = Offset(0, 0);
    final end = Offset(-((width / 100) * 37), (height / 100) * 15);

    final paint = Paint()
      ..color = white
      ..strokeWidth = 2;
    canvas.drawLine(start, end, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
