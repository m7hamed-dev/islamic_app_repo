import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran/animation/bottom_animation.dart';
import 'package:quran/styles/row_select_color.dart';
import 'package:quran/tools/constants.dart';
import 'package:quran/tools/screen_util.dart';
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
            color: Theme.of(context).primaryColor.withOpacity(.3),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
          child: SingleChildScrollView(
            physics: Constants.bouncScrollPhysics,
            child: Column(
              children: [
                InkWell(
                  onTap: () => _settings.changeStateNavBottomSettings(context),
                  child: Container(
                    height: 20.0,
                    width: ScreenUtil.getWidth(context) / 3,
                    alignment: Alignment.center,
                    margin: const EdgeInsets.symmetric(vertical: 9.0),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor.withOpacity(.2),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Container(
                      height: 9.0,
                      width: ScreenUtil.getWidth(context) / 4,
                      // margin: const EdgeInsets.symmetric(vertical: 9.0),
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8.0),
                const SliderChangeSizeFont(),
                const SizedBox(height: 8.0),
                const RowFontTypes(),
                const SizedBox(height: 8.0),
                const RowSelectColor()
              ].map((e) {
                // index += 1;
                return BottomAnimator(
                  child: e,
                  time: const Duration(milliseconds: 300),
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}
