import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran/storage/local_storage.dart';
import 'package:quran/views/settings/settings_controller.dart';
import 'package:quran/widgets/btn.dart';
import 'package:quran/widgets/txt.dart';

class RowSelectLang extends StatelessWidget {
  const RowSelectLang({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Row(
      children: List.generate(2, (index) {
        return Consumer<SettingsController>(
          builder: (context, _controller, _) {
            return Expanded(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 400),
                child: Btn(
                  margin: const EdgeInsets.symmetric(horizontal: 2.0),
                  color: _controller.savedLangIndex == index
                      ? Colors.red
                      : Colors.blue,
                  child: Txt(
                    index == 1 ? 'arabic' : 'english',
                    isUseFontSizePrefs: false,
                  ),
                  onPressed: () {
                    if (index == 1) {
                      _controller.isArabic = true;
                    } else {
                      _controller.isArabic = false;
                    }
                    _controller.changeLang(context, _controller.isArabic);
                    LocalStorage.saveIndex('lnag_key', index);
                  },
                ),
              ),
            );
          },
        );
      }),
    ));
  }
}
