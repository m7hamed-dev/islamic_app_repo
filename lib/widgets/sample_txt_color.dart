import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran/views/settings/settings_controller.dart';
import 'package:quran/widgets/txt.dart';

class SampleTxtColor extends StatelessWidget {
  const SampleTxtColor({Key? key}) : super(key: key);
  //
  @override
  Widget build(BuildContext context) {
    debugPrint('smaple txt and color rebuild .......');
    return Consumer<SettingsController>(
      builder: (context, _controller, _) {
        return const Center(
          child: Txt(
            'مثال',
          ),
        );
      },
    );
  }
}
