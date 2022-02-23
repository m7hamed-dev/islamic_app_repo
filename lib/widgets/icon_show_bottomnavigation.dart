import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran/views/settings/settings_controller.dart';

class IconShowBottomNavigation extends StatelessWidget {
  const IconShowBottomNavigation({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: () => context
            .read<SettingsController>()
            .changeStateNavBottomSettings(context),
        borderRadius: BorderRadius.circular(20.0),
        child: const Icon(Icons.more_vert_rounded),
      ),
    );
  }
}
