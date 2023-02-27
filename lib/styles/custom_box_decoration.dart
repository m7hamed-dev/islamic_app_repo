import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:quran/global/depency_injection.dart';

class CustomBoxDecoraton {
  //
  static BoxDecoration decoration(BuildContext context) {
    //
    return BoxDecoration(
      borderRadius: BorderRadius.circular(20.0),
      color: DI.themeController(context).isDarkTheme
          ? HexColor('#444d56')
          : Colors.white,
      boxShadow: [
        BoxShadow(
          color: Theme.of(context).primaryColor.withOpacity(.030),
          blurRadius: 5.0,
          spreadRadius: 5.0,
          // offset: const Offset(90.0, 2.4),
        )
      ],
    );
  }
}
