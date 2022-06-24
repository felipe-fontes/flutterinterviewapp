import 'package:flutter/material.dart';
import 'package:interviewapp/shared/utils/colors.dart';

class MyCard extends StatelessWidget {
  final Color shadowColor;
  final Widget child;
  final double bolderRadius;
  final Alignment gradientStart;
  final Alignment gradientEnd;
  final double blurRadius;
  final Offset shadowOffset;

  MyCard({
    Key key,
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
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: AppColors.backgroundWhite,
        borderRadius: BorderRadius.circular(this.bolderRadius),
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
