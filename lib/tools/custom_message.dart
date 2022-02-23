import 'package:flutter/material.dart';

class CustomMessage {
  //
  static void showCustomSnackBar(
    BuildContext context,
    // String message,
    {
    Color? backgroundColor,
    Widget? content,
  }) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    //
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: backgroundColor,
        content: content ?? const SizedBox(width: 0.0, height: 0.0),
      ),
    );
  } //

  static void showSnackBarGlobal(
    BuildContext context,
    String message, {
    Color? backgroundColor,
  }) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    //
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: backgroundColor,
        content: Text(
          message,
          textScaleFactor: 2,
        ),
      ),
    );
  }

  static void showCongratuldationsSnackBar(BuildContext context, String message,
      {Color? backgroundColor, int? countTsbih}) {
    // if count == 90 then show snackbar
    if (countTsbih != null && countTsbih == 90) {
      showSnackBarGlobal(context, message);
    }
  }
}
