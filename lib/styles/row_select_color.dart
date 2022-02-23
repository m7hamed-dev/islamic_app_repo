import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran/styles/theme_controller.dart';
import 'package:quran/widgets/btn.dart';
import 'package:quran/widgets/txt_trans.dart';

class RowSelectColor extends StatelessWidget {
  const RowSelectColor({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint('RowSelectColor rebuild ..');
    return Column(
      children: [
        // ligth or dark mode
        Row(
          children: List.generate(
              context.read<ThemeController>().themeTypes.length, (index) {
            return Expanded(
              child: Btn(
                height: 50.0,
                onPressed: () {
                  context.read<ThemeController>().changeThemeMode(index);
                },
                color: context.read<ThemeController>().colors[index],
                padding: const EdgeInsets.all(4.0),
                child: TxtTrans(
                  context.read<ThemeController>().themeTypes[index],
                  isUseFontSizePrefs: false,
                  fontSize: 18.0,
                  color: Colors.white,
                ),
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 10.0),
        // colors
        Visibility(
          visible: context.read<ThemeController>().isDark == false,
          child: Row(
            children: List.generate(
                context.watch<ThemeController>().colors.length, (index) {
              return Expanded(
                child: MaterialButton(
                  height: 50.0,
                  onPressed: () {
                    context.read<ThemeController>().changeThemeColor(index);
                  },
                  color: context.read<ThemeController>().colors[index],
                  // textColor: Colors.white,
                  padding: const EdgeInsets.all(4.0),
                  shape: const CircleBorder(),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
