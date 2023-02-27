import 'package:flutter/material.dart';

class AppBarTitle extends StatelessWidget {
  const AppBarTitle(
    this.title, {
    Key? key,
  }) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) => Text(title);
}
