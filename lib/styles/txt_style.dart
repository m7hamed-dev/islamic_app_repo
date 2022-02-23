import 'package:flutter/material.dart';

class TxtStyle {
  static TextStyle normalStyle({Color? color}) {
    return TextStyle(
      color: color ?? Colors.black,
      fontSize: 15.0,
      fontFamily: 'pfd',
    );
  }

  static TextStyle customStyle({
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    String? fontFamily,
  }) {
    return TextStyle(
      color: color ?? Colors.black,
      fontSize: fontSize ?? 15.0,
      fontFamily: fontFamily ?? 'pfd',
      // fontWeight: fontWeight ?? FontWeight.w700,
    );
  }
}
