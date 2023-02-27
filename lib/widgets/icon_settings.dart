import 'package:flutter/material.dart';
import 'package:quran/tools/push.dart';
import 'package:quran/views/settings/settings_view.dart';
import 'package:quran/widgets/circular_icon.dart';

class IconSettings extends StatelessWidget {
  const IconSettings({Key? key, this.color}) : super(key: key);
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      onPressed: () => Push.to(context, const SettingsView()),
      icon: const CircleIcon(icon: Icons.settings),
    );
  }
}
