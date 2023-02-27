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
      builder: (context, _controller, _) {
        return ListTileSetting(
          title: 'السماح للتسبيح بالإهتزاز',
          subtitle: Txt(
            _controller.getCanVibrate == false ? 'سماح' : 'منع',
            isUseFontSizePrefs: false,
            fontSize: 15.9,
            fontFamily: 'pfd',
            fontWeight: FontWeight.w100,
          ),
          onTap: _controller.getCanVibrate ? _controller.runVibrate : null,
          icon: Icons.vibration,
          trailing: CupertinoSwitch(
            value: _controller.getCanVibrate,
            onChanged: _controller.onChanged,
            activeColor: Theme.of(context).primaryColor,
            trackColor: Theme.of(context).primaryColor.withOpacity(.2),
          ),
        );
      },
    );
  }
}
