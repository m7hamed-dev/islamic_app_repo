import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran/views/settings/settings_controller.dart';

class SliderChangeSizeFont extends StatelessWidget {
  const SliderChangeSizeFont({Key? key}) : super(key: key);
  //
  @override
  Widget build(BuildContext context) {
    return Slider(
      min: 10.0,
      max: 40.0,
      divisions: 10,
      value: context.watch<SettingsController>().fontSize,
      label: context.watch<SettingsController>().fontSize.truncate().toString(),
      onChanged: context.watch<SettingsController>().changeFontSize,
    );
  }
}
