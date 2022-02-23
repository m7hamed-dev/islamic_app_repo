import 'package:flutter/material.dart';

class HideKeyBoard {
  static void hide(BuildContext context) =>
      FocusScope.of(context).requestFocus(FocusNode());
}
