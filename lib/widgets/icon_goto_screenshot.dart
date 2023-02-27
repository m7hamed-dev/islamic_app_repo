import 'package:flutter/material.dart';
import 'package:quran/global/depency_injection.dart';
import 'package:quran/tools/push.dart';
import 'package:quran/widgets/take_screenshot_mywidget.dart';

class IconGoToScreenShot extends StatelessWidget {
  //
  const IconGoToScreenShot({
    Key? key,
    required this.text,
    required this.title,
  }) : super(key: key);
  //
  final String text;
  final String title;
  //
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Push.to(
        context,
        TakeScreenShotMyWidget(text: text, title: title),
      ),
      child: Icon(
        Icons.screenshot_rounded,
        color: DI.themeController(context).isDarkTheme
            ? Colors.white
            : DI.primaryColor(context),
        // : Colors.black,
      ),
    );
  }
}
