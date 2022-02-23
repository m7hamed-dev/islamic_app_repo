import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran/views/settings/settings_controller.dart';

class IconChangeLang extends StatelessWidget {
  const IconChangeLang({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Consumer<SettingsController>(
        builder: (context, _controller, _) {
          return Switch(
            value: _controller.isArabic,
            onChanged: (newValue) => _controller.changeLang(context, newValue),
          );
        },
      ),
    );
  }
}
