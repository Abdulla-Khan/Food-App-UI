import 'package:flutter/material.dart';

import 'colors.dart';

class PrimaryWidget extends StatelessWidget {
  final String text;
  final Color color;
  final double size;
  final FontWeight fontWeight;
  final double height;
  PrimaryWidget({
    Key? key,
    required this.text,
    this.color: AppColors.secondary,
    required this.size,
    this.fontWeight: FontWeight.w400,
    this.height: 1.3,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: fontWeight,
        height: height,
      ),
    );
  }
}
