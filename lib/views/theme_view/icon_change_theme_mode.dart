import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:quran/global/depency_injection.dart';
import 'package:quran/styles/theme_controller.dart';

class IconChangeThemeMode extends StatelessWidget {
  const IconChangeThemeMode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeController>(
      builder: (context, themeController, _) {
        return CupertinoSwitch(
          value: themeController.isDarkTheme,
          onChanged: themeController.onChange,
          activeColor: DI.primaryColor(context),
          trackColor: DI.primaryColor(context).withOpacity(.2),
        );
      },
    );
  }
}
