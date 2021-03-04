import 'package:flutter/material.dart';

class GradientCard extends StatelessWidget {
  final Color startColor;
  final Color endColor;
  final Color shadowColor;
  final Widget child;
  final double bolderRadius;
  final Alignment gradientStart;
  final Alignment gradientEnd;
  final double blurRadius;
  final Offset shadowOffset;

  GradientCard({
    Key key,
    @required this.startColor,
    @required this.endColor,
    @required this.shadowColor,
    @required this.child,
    this.bolderRadius = 24,
    this.gradientStart = Alignment.topLeft,
    this.gradientEnd = Alignment.bottomRight,
    this.blurRadius = 12,
    this.shadowOffset = const Offset(0, 6),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(this.bolderRadius),
        gradient: LinearGradient(
            colors: [this.startColor, this.endColor],
            begin: this.gradientStart,
            end: this.gradientEnd),
        boxShadow: [
          BoxShadow(
            color: this.shadowColor,
            blurRadius: this.blurRadius,
            offset: this.shadowOffset,
          ),
        ],
      ),
      child: child,
    );
  }
}
