import 'package:flutter/material.dart';
import 'package:quran/global/depency_injection.dart';

class AppBarTitle extends StatelessWidget {
  const AppBarTitle(
    this.title, {
    Key? key,
  }) : super(key: key);
  //
  final String title;
  //
  @override
  Widget build(BuildContext context) => Text(
        title,
        style: const TextStyle(
          fontSize: 20.0,
          // color: DI.themeController(context, isListen: true).isDarkTheme
          //     ? DI.primaryColor(context)
          //     : Colors.white,
          // : Colors.black,
          // : DI.primaryColor(context),
          // fontWeight: FontWeight.bold,
          // fontFamily: 'Hacen',
          // fontFamily: 'dinn-reg',
        ),
      );
}
