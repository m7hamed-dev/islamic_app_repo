import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran/views/settings/settings_controller.dart';
import 'package:quran/widgets/listtile_setting.dart';

class SliderChangeSizeFont extends StatelessWidget {
  const SliderChangeSizeFont({Key? key}) : super(key: key);
  //
  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsController>(
      builder: (context, _controller, _) {
        return ListTileSetting(
          title: 'حجم الخط ${_controller.fontSize}',
          subtitle: Row(
            children: [
              Expanded(
                child: Slider(
                  min: 12.0,
                  max: 24.0,
                  divisions: 4,
                  value: _controller.fontSize,
                  label: _controller.fontSize.truncate().toString(),
                  onChanged: _controller.changeFontSize,
                  activeColor: Theme.of(context).primaryColor,
                ),
              ),
              // Expanded(
              //   flex: 1,
              //   child: Txt(
              //     'حجم الخط ${_controller.fontSize}',
              //     isUseFontSizePrefs: false,
              //     fontSize: 16.0,
              //   ),
              // ),
            ],
          ),
          icon: Icons.font_download_rounded,
        );
      },
    );
  }
}
