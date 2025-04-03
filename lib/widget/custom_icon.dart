import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  final double? size;
  final Color ?color;
  const CustomIcon({
    super.key, required this.icon,
    this.size,
    this.color
  });

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Icon(icon,color: color,size: size,);
  }
}