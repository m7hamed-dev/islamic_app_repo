import 'package:flutter/material.dart';

class CircleIcon extends StatelessWidget {
  const CircleIcon({
    Key? key,
    required this.icon,
    this.colorCircle,
    this.colorIcon,
    this.width,
    this.height,
    this.size,
  }) : super(key: key);
  final IconData icon;
  final Color? colorIcon;
  final Color? colorCircle;
  final double? width;
  final double? height;
  final double? size;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.all(5.0),
      margin: const EdgeInsets.all(3.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: colorCircle ?? Colors.red.shade100,
        shape: BoxShape.circle,
      ),
      child: Icon(
        icon,
        color: colorIcon,
        size: size,
      ),
    );
  }
}
