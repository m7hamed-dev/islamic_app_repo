import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran/views/settings/settings_controller.dart';
import 'package:quran/widgets/txt.dart';
import 'btn.dart';

class RowFontTypes extends StatelessWidget {
  const RowFontTypes({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint('RowFontTypes rebuild ..');
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: const Txt(
        'font types',
        isUseFontSizePrefs: false,
      ),
      subtitle: Consumer<SettingsController>(
        builder: (context, _controller, _) {
          return Row(
            children: List.generate(4, (index) {
              return Expanded(
                child: Btn(
                  margin: const EdgeInsets.symmetric(horizontal: 2.0),
                  child: Txt(
                    _controller.fontsName[index],
                    isUseFontSizePrefs: false,
                  ),
                  onPressed: () => _controller.onSeletedFontType(index),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
