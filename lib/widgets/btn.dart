import 'package:flutter/material.dart';
import 'package:quran/global/depency_injection.dart';
import 'package:quran/tools/screen_util.dart';

class Btn extends StatelessWidget {
  const Btn({
    Key? key,
    required this.child,
    this.width,
    this.height,
    this.shape,
    this.padding,
    this.color,
    this.onPressed,
    this.margin,
    this.elevation,
  }) : super(key: key);
  final double? width;
  final double? height;
  final double? elevation;
  final Widget child;
  final OutlinedBorder? shape;
  final void Function()? onPressed;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final EdgeInsetsGeometry? margin;
  //
  @override
  Widget build(BuildContext context) {
    //
    return Container(
      height: height,
      width: width ?? ScreenUtil.getWidth(context),
      margin: margin,
      padding: padding,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: elevation ?? 0.0,
          primary: DI.themeController(context, isListen: true).isDarkTheme
              ? Colors.teal
              : DI.primaryColor(context).withOpacity(.8),
          padding: padding,
          shape: shape,
        ),
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
