import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:quran/global/depency_injection.dart';
import 'package:quran/tools/constants.dart';

class CustomCard extends StatelessWidget {
  //
  const CustomCard({
    Key? key,
    required this.child,
    this.margin,
    this.padding,
    this.width,
    this.height,
    this.onTap,
  }) : super(key: key);
  //
  final Widget child;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final double? width;
  final double? height;
  final void Function()? onTap;
  //
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? Constants.margin,
      padding: padding ?? Constants.padding,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(18.0)),
        color: DI.themeController(context, isListen: true).isDarkTheme
            ? HexColor('#444d56')
            : Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.04),
            spreadRadius: 10.0,
            blurRadius: 10.0,
          )
        ],
      ),
      alignment: Alignment.center,
      child: Material(
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        // borderRadius: BorderRadius.circular(10.0),
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          splashColor: DI.primaryColor(context).withOpacity(.2),
          child: child,
        ),
      ),
    );
    //
  }
}
