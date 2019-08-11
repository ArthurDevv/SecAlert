import 'package:flutter/material.dart';

class CustomFab extends StatefulWidget {
  final Icon child;
  final double notchMargin;
  final VoidCallback onPressed;
  final Color color;

  CustomFab({
    this.child,
    this.notchMargin: 8.0,
    this.onPressed,
    this.color,
  });

  @override
  _CustomFabState createState() => _CustomFabState();
}

class _CustomFabState extends State<CustomFab> {
  // VoidCallback _notchChange;

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: CustomBorder(),
      elevation: 2.0,
      color: widget.color,
      child: InkWell(
        onTap: widget.onPressed,
        child: Container(
          width: 55.0,
          height: 55.0,
          child: widget.child,
        ),
      ),
    );
  }
}

const double _topPadding = 20.0;
const double _arcRadius = 8.0;

class CustomBorder extends BorderDirectional {
  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) {
    Size size = rect.size;
    double point = size.width / 3 * 2;
    final path = Path()
      ..moveTo(0.0, _topPadding)
      ..lineTo(point, _topPadding)
      ..lineTo(point, _arcRadius)
      ..lineTo(point + _arcRadius, 0.0)
      ..lineTo(size.width - _arcRadius, 0.0)
      ..lineTo(size.width, _arcRadius)
      ..lineTo(size.width, size.height)
      ..lineTo(0.0, size.height)
      ..lineTo(0.0, _topPadding)
      ..addOval(
          Rect.fromLTRB(point, 0.0, point + 2 * _arcRadius, 2 * _arcRadius))
      ..addOval(Rect.fromLTRB(
          size.width - 2 * _arcRadius, 0.0, size.width, 2 * _arcRadius));

    path.close();
    return path;
  }
}
