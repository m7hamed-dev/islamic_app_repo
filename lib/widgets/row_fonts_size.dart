import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran/views/settings/settings_controller.dart';
import 'package:quran/widgets/txt.dart';
import 'btn.dart';

class RowFontsSize extends StatelessWidget {
  const RowFontsSize({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: const Txt(
        'font size',
        isUseFontSizePrefs: false,
      ),
      subtitle: Consumer<SettingsController>(
        builder: (context, _controller, _) {
          return Row(
            children: List.generate(3, (index) {
              return Expanded(
                child: Btn(
                  margin: const EdgeInsets.symmetric(horizontal: 2.0),
                  child: Txt(_controller.fontsSize[index]),
                  onPressed: () {
                    _controller.onSeletedFontSize(context, index);
                  },
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
