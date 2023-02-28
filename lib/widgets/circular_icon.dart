import 'package:flutter/material.dart';
import 'package:quran/global/depency_injection.dart';
import 'package:quran/widgets/blur_widget.dart';

class CircleIcon extends StatelessWidget {
  const CircleIcon({
    Key? key,
    required this.icon,
    this.sizeIcon,
    this.colorIcon,
  }) : super(key: key);

  ///
  final IconData icon;
  final Color? colorIcon;
  final double? sizeIcon;

  ///
  @override
  Widget build(BuildContext context) {
    return BlurWidget(
      child: Icon(
        icon,
        color: DI.primaryColor(context),
        // color: Colors.white,
        size: sizeIcon ?? 22.0,
      ),
    );
  }
}
