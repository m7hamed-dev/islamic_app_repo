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

const maraiRegular = TextStyle(
  fontFamily: 'Almarai',
  fontWeight: FontWeight.w400,
  fontSize: 12,
  // fontSize: Dimensions.fontSizeDefault,
);

const maraiMedium = TextStyle(
  fontFamily: 'Almarai',
  fontWeight: FontWeight.w500,
  fontSize: 14,
  // fontSize: Dimensions.fontSizeDefault,
);

const maraiBold = TextStyle(
  fontFamily: 'Almarai',
  fontWeight: FontWeight.w700,
  fontSize: 16,
  // color: Colors.black,
  // fontSize: Dimensions.fontSizeDefault,
);

const maraiBlack = TextStyle(
  fontFamily: 'Almarai',
  fontWeight: FontWeight.w900,
  fontSize: 18,
  // color: Colors.black,
  // fontSize: Dimensions.fontSizeDefault,
);
