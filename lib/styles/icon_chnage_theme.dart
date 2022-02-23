import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran/styles/theme_controller.dart';

class IconChangeThemeApp extends StatelessWidget {
  const IconChangeThemeApp({Key? key}) : super(key: key);
  // final ThemeController themeController;
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeController>(
      builder: (context, controller, child) {
        return Wrap(
          // mainAxisSize: MainAxisSize.min,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(controller.isDark ? 'dark theme' : 'light theme'),
            Switch(
              value: controller.isDark,
              onChanged: (value) {
                controller.isDark = value;
                // controller.svaeTheme(controller.isDark);
              },
            ),
          ],
        );
      },
    );
  }
}
