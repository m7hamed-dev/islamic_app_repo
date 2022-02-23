import 'package:flutter/material.dart';
// import 'package:quran/settings/settings_view.dart';
import 'package:quran/tools/push.dart';
import 'package:quran/views/settings/settings_view.dart';

class WidgetGoToSettings extends StatelessWidget {
  const WidgetGoToSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => Push.to(context, const SettingsView()),
      icon: const Icon(Icons.settings),
    );
  }
}
