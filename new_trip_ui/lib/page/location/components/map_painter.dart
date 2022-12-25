import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NormalMapLinePainter extends CustomPainter {
  List<Offset> points;
  final Animation<double> repetAnimation;
  NormalMapLinePainter({required this.repetAnimation, required this.points});

  @override
  void paint(Canvas canvas, Size size) {
    if (points.isEmpty) return;
    Path path = Path();
    Offset origin = points[0];
    path.moveTo(origin.dx, origin.dy);
    for (var i = 0; i < points.length; i++) {
      path.lineTo(points[i].dx, points[i].dy);
    }
    final path1 = createAnimatedPath(path, repetAnimation.value);
    canvas.drawPath(
      path1,
      Paint()
        ..color = Theme.of(Get.context!).primaryColor
        ..style = PaintingStyle.stroke
        ..strokeWidth = 3.0,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

Path createAnimatedPath(Path originalPath, double animationPercent) {
  // ComputeMetrics can only be iterated once!
  final totalLength = originalPath
      .computeMetrics()
      .fold(0.0, (double prev, PathMetric metric) => prev + metric.length);

  final currentLength = totalLength * animationPercent;

  return extractPathUntilLength(originalPath, currentLength);
}

Path extractPathUntilLength(Path originalPath, double currentLength) {
  final path = Path();

  var metricsIterator = originalPath.computeMetrics().iterator;

  while (metricsIterator.moveNext()) {
    var metric = metricsIterator.current;

    var nextLength = metric.length;

    final isLastSegment = nextLength > currentLength;
    if (isLastSegment) {
      final remainingLength = currentLength;
      final pathSegment = metric.extractPath(0, remainingLength);
      path.addPath(pathSegment, Offset.zero);
      break;
    } else {
      // There might be a more efficient way of extracting an entire path
      final pathSegment = metric.extractPath(0, metric.length);
      path.addPath(pathSegment, Offset.zero);
    }
  }

  return path;
}

class MapLinePainter extends CustomPainter {
  List<Offset> points;
  final Animation<double> repetAnimation;
  Color color;

  MapLinePainter({
    required this.repetAnimation,
    required this.points,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (points.isEmpty) return;
    Path path = Path();
    Offset origin = points[0];
    path.moveTo(origin.dx, origin.dy);
    for (var i = 0; i < points.length; i++) {
      path.lineTo(points[i].dx, points[i].dy);
    }
    final path2 = createAnimatedRepetPath(path, repetAnimation.value);
    canvas.drawPath(
      path2,
      Paint()
        ..color = color
        ..style = PaintingStyle.stroke
        ..strokeWidth = 3.0,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

Path createAnimatedRepetPath(Path originalPath, double animationPercent) {
  // ComputeMetrics can only be iterated once!
  final totalLength = originalPath
      .computeMetrics()
      .fold(0.0, (double prev, PathMetric metric) => prev + metric.length);

  final currentLength = totalLength * animationPercent;

  return extractPathUntilRepetLength(originalPath, currentLength);
}

Path extractPathUntilRepetLength(Path originalPath, double currentLength) {
  final path = Path();
  var metricsIterator = originalPath.computeMetrics().iterator;

  while (metricsIterator.moveNext()) {
    var metric = metricsIterator.current;
    var bluelenth = metric.length * 0.20;
    double startpoint =
        (currentLength - bluelenth >= 0.0) ? (currentLength - bluelenth) : 0.0;
    final pathSegment = metric.extractPath(startpoint + currentLength * 0.20,
        currentLength + currentLength * 0.20);
    path.addPath(pathSegment, Offset.zero);
    break;
  }
  return path;
}
