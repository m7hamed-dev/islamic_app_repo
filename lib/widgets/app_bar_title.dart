import 'package:flutter/material.dart';
import 'package:quran/styles/txt_style.dart';

class AppBarTitle extends StatelessWidget {
  const AppBarTitle(
    this.title, {
    Key? key,
  }) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) => Text(
        title,
        style: maraiBold.copyWith(color: Colors.white),
      );
}
