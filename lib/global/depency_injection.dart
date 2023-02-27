import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran/styles/theme_controller.dart';
import 'package:quran/views/settings/settings_controller.dart';

// dependencies injection for all controllers ( provider  )
class DI {
  //
  static ThemeController themeController(BuildContext context,
      {bool? isListen}) {
    if (isListen == true) {
      return context.watch<ThemeController>();
    }
    return context.read<ThemeController>();
  }

  //
  static Color primaryColor(BuildContext context) =>
      Theme.of(context).primaryColor;
  //

  static SettingsController settingsController(BuildContext context,
      {bool? isListen}) {
    return context.watch<SettingsController>();
  }
}
