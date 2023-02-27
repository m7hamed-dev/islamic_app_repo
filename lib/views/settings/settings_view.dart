import 'package:flutter/material.dart';
import 'package:quran/tools/constants.dart';
import 'package:quran/views/settings/widgets_setting.dart';
import 'package:quran/widgets/icon_leading.dart';
import '../../animation/bottom_animation.dart';
import '../../widgets/app_bar_title.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint('rebuild settings view ............');
    return Scaffold(
      appBar: AppBar(
        title: const AppBarTitle('الإعدادات'),
        // shape: CustomAppBarShape(),
        leading: const IconLeading(),
      ),
      body: ListView.builder(
        itemCount: widgetsSetting.length,
        physics: Constants.bouncScrollPhysics,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: BottomAnimator(
              time: Duration(
                milliseconds: 200 * index + 10,
              ),
              child: widgetsSetting[index],
            ),
          );
        },
      ),
    );
  }
}
