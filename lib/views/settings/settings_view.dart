import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran/styles/row_select_color.dart';
import 'package:quran/styles/txt_style.dart';
import 'package:quran/tools/push.dart';
import 'package:quran/views/about_devloper/about_devloper_view.dart';
import 'package:quran/views/lang/icon_change_lang.dart';
import 'package:quran/views/lang/row_select_lang.dart';
import 'package:quran/widgets/btn.dart';
import 'package:quran/widgets/row_font_types.dart';
import 'package:quran/widgets/row_fonts_size.dart';
import 'package:quran/widgets/slider_change_size_font.dart';
import 'package:quran/widgets/txt.dart';

import 'settings_controller.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    debugPrint('rebuild settings view ............');
    return Scaffold(
      appBar: AppBar(
        title: const Txt(
          'Settings page',
          isUseFontSizePrefs: false,
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            const RowFontTypes(),
            const RowFontsSize(),
            const SizedBox(height: 20.0),
            const RowSelectLang(),
            const SizedBox(height: 20.0),
            const RowSelectColor(),
            const SizedBox(height: 20.0),
            Btn(
              child: const Text('about us'),
              onPressed: () => Push.to(context, const AboutDeveloperView()),
            ),
            Column(
              children: [
                InkWell(
                  onTap: () => context.read<SettingsController>(),
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
                Row(
                  children: [
                    const IconChangeLang(),
                    Txt(
                      context.watch<SettingsController>().isArabic
                          ? 'english'
                          : 'arabic',
                      isUseFontSizePrefs: false,
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
      // bottomNavigationBar: const NavigationBbottomSettings(),
    );
  }
}
