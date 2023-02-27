import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran/global/vibrate_apis.dart';
import 'listtile_setting.dart';
import 'txt.dart';

class IconSwitchVibrate extends StatelessWidget {
  const IconSwitchVibrate({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    debugPrint('IconSwitchVibrate.....');
    return Consumer<VibrateAPIsProvider>(
      builder: (context, controller, _) {
        return ListTileSetting(
          title: 'السماح للتسبيح بالإهتزاز',
          subtitle: Txt(
            controller.getCanVibrate == false ? 'سماح' : 'منع',
            isUseFontSizePrefs: false,
            fontSize: 15.9,
          ),
          onTap: controller.getCanVibrate ? controller.runVibrate : null,
          icon: Icons.vibration,
          trailing: CupertinoSwitch(
            value: controller.getCanVibrate,
            onChanged: controller.onChanged,
            activeColor: Theme.of(context).primaryColor,
            trackColor: Theme.of(context).primaryColor.withOpacity(.2),
          ),
        );
      },
    );
  }
}
