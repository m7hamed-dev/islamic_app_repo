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
        backgroundColor: backgroundColor ?? Theme.of(context).primaryColor,
        content: content ?? const SizedBox(),
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
}
