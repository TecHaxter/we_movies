import 'package:flutter/widgets.dart';

class WeMoviesTopRatedCutOutBoxClipperWidget extends CustomClipper<Path> {
  final Size? topLeftCutOutSize;
  final Size? bottomRightCutOutSize;
  final double curveRadius;

  WeMoviesTopRatedCutOutBoxClipperWidget({
    this.topLeftCutOutSize,
    this.bottomRightCutOutSize,
    required this.curveRadius,
  });

  @override
  Path getClip(Size size) {
    Path path = Path();

    if (topLeftCutOutSize != null) {
      double topLeftWidth = topLeftCutOutSize!.width;
      double topLeftHeight = topLeftCutOutSize!.height;

      // Start from (0, topLeftHeight + curveConstant)
      path.moveTo(0, topLeftHeight + curveRadius);

      // Draw an outward quadratic curve till (0, curveRadius)
      path.quadraticBezierTo(0, topLeftHeight, curveRadius, topLeftHeight);

      // Make a line till (topLeftWidth - curveRadius, topLeftHeight)
      path.lineTo(topLeftWidth - curveRadius, topLeftHeight);

      // Draw an inward quadratic curve till (topLeftWidth, topLeftHeight/2)
      path.quadraticBezierTo(
          topLeftWidth, topLeftHeight, topLeftWidth, topLeftHeight / 2);

      // Draw an outward quadratic curve till (topLeftWidth + curveRadius, 0)
      path.quadraticBezierTo(topLeftWidth, 0, topLeftWidth + curveRadius, 0);
    } else {
      // Start from (0, curveRadius)
      path.moveTo(0, curveRadius);

      // Draw an outward quadratic curve till (0, curveRadius)
      path.quadraticBezierTo(0, 0, curveRadius, 0);
    }

    // Draw a line till (size.width - curveRadius, 0)
    path.lineTo(size.width - curveRadius, 0);

    // Draw an outward quadratic curve till (size.width, curveRadius)
    path.quadraticBezierTo(size.width, 0, size.width, curveRadius);

    if (bottomRightCutOutSize != null) {
      double bottomRightWidth = bottomRightCutOutSize!.width;
      double bottomRightHeight = bottomRightCutOutSize!.height;

      // Draw a line till (size.width, size.height - bottomRightHeight - curveRadius)
      path.lineTo(size.width, size.height - bottomRightHeight - curveRadius);

      // Draw an outward quadratic curve till (size.width - curveRadius, size.height - bottomRightHeight)
      path.quadraticBezierTo(size.width, size.height - bottomRightHeight,
          size.width - curveRadius, size.height - bottomRightHeight);

      // Draw an inward quadratic curve till (size.width - bottomRightWidth, size.height - curveRadius)
      path.quadraticBezierTo(
          size.width - bottomRightWidth,
          size.height - bottomRightHeight,
          size.width - bottomRightWidth,
          size.height - curveRadius);

      // Draw an outward quadratic curve till (size.width - bottomRightWidth - curveRadius, size.height)
      path.quadraticBezierTo(size.width - bottomRightWidth, size.height,
          size.width - bottomRightWidth - curveRadius, size.height);
    } else {
      // Draw a line till (size.width, size.height - curveRadius)
      path.lineTo(size.width, size.height - curveRadius);

      // Draw an outward quadratic curve till (size.width - curveRadius, size.height)
      path.quadraticBezierTo(
          size.width, size.height, size.width - curveRadius, size.height);
    }

    // Draw a line till (curveRadius, size.height)
    path.lineTo(curveRadius, size.height);

    // Draw an outward quadratic curve till (0, size.height - curveRadius)
    path.quadraticBezierTo(0, size.height, 0, size.height - curveRadius);

    // Close the path
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    if (oldClipper.runtimeType != runtimeType) return true;
    return oldClipper is WeMoviesTopRatedCutOutBoxClipperWidget &&
        oldClipper.topLeftCutOutSize != topLeftCutOutSize &&
        oldClipper.bottomRightCutOutSize != bottomRightCutOutSize;
  }
}
