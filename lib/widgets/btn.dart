import 'package:flutter/material.dart';

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
    return Container(
      height: height,
      width: width,
      // alignment: Alignment.center,
      // width: width ?? ScreenUtil.getWidth(context),
      margin: margin,
      padding: padding,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: elevation ?? 0.0,
          primary: color ?? Colors.green[700],
          // primary: Theme.of(context).primaryColorDark,
          padding: padding,
          shape: shape,
        ),
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
