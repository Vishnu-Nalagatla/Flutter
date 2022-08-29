import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final double? elevation;
  final Color? shadowColor;
  final EdgeInsetsGeometry? margin;
  final Widget child;
  final ShapeBorder? shape;
  const CustomCard({
    Key? key,
    this.elevation,
    this.shadowColor,
    required this.child,
    this.margin,
    this.shape,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation ?? 6,
      shadowColor: shadowColor,
      margin: margin,
      shape: shape,
      child: child,
    );
  }
}
