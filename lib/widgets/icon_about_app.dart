import 'package:flutter/material.dart';
import 'package:quran/tools/push.dart';
import '../views/about_devloper/about_devloper_view.dart';

class IconAboutApp extends StatelessWidget {
  const IconAboutApp({Key? key, this.color}) : super(key: key);
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => Push.to(context, const AboutDeveloperView()),
      icon: Icon(
        Icons.app_shortcut_rounded,
        color: color ?? Theme.of(context).primaryColor,
      ),
    );
  }
}
