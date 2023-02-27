import 'package:flutter/material.dart';
import 'package:quran/global/depency_injection.dart';

class CircleIcon extends StatelessWidget {
  const CircleIcon({
    Key? key,
    required this.icon,
    this.sizeIcon,
    this.colorIcon,
    // this.width,
    // this.height,
    // this.size,
  }) : super(key: key);
  final IconData icon;
  final Color? colorIcon;
  final double? sizeIcon;
  //
  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      color: DI.themeController(context, isListen: true).isDarkTheme
          ? Colors.white
          : Theme.of(context).primaryColor,
      size: sizeIcon ?? 24.0,
    );
  }
}
