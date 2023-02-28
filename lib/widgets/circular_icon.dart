import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran/styles/theme_controller.dart';

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
    return Consumer<ThemeController>(
      builder: (context, provider, _) {
        return Container(
          padding: const EdgeInsets.all(6.0),
          decoration: BoxDecoration(
            color: !provider.isDarkTheme
                ? Theme.of(context).primaryColor.withOpacity(.5)
                : Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(12.0)),
          ),
          child: Icon(
            icon,
            // color: DI.themeController(context, isListen: true).isDarkTheme
            color: Colors.white,
            // : Theme.of(context).primaryColor,
            size: sizeIcon ?? 22.0,
          ),
        );
      },
    );
  }
}
