import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran/views/lang/row_select_lang.dart';
import 'package:quran/views/settings/settings_controller.dart';

import 'row_font_types.dart';
import 'slider_change_size_font.dart';

class NavigationBbottomSettings extends StatelessWidget {
  const NavigationBbottomSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsController>(
      builder: (context, _settings, _) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          padding: const EdgeInsets.all(10.0),
          height: _settings.heighBottomNavigation,
          decoration: BoxDecoration(
            color: Colors.green.shade100,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                InkWell(
                  onTap: () => _settings.changeStateNavBottomSettings(context),
                  child: Container(
                    height: 20.0,
                    width: 100,
                    margin: const EdgeInsets.symmetric(vertical: 9.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                const Text('font size'),
                const SliderChangeSizeFont(),
                const RowFontTypes(),
                const RowSelectLang(),
              ],
            ),
          ),
        );
      },
    );
  }
}
