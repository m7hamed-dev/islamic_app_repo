import 'package:flutter/material.dart';

class ScreenUtil {
  static double getHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;
  //
  static double getWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;
  //
  static bool isMobile(BuildContext context) =>
      getWidth(context) >= 400.0 ? false : true;
  //
  static int getCrossAxisCount(BuildContext context) =>
      getWidth(context) >= 500 ? 4 : 3;
  //
  static double getChildAspectRatio(BuildContext context) =>
      getWidth(context) >= 500 ? 2 / 1.4 : 2 / 1.4;
}
