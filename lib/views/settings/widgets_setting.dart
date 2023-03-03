import 'package:flutter/material.dart';
import 'package:quran/tools/push.dart';
import 'package:quran/views/about_devloper/about_devloper_view.dart';
// import 'package:quran/widgets/switch_read_quran_online_pdf.dart';
import '../../styles/row_select_color.dart';
import '../../widgets/btn.dart';
import '../../widgets/slider_change_size_font.dart';
import '../../widgets/txt.dart';

const widgetsSetting = <Widget>[
  // IconSwitchVibrate(),
  RowSelectColor(),
  SliderChangeSizeFont(),
  BtnGoToAboutDeveloper(),
  // SampleTxtColor(),
];

class BtnGoToAboutDeveloper extends StatelessWidget {
  const BtnGoToAboutDeveloper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Btn(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: const Txt(
        'مشاركة التطبيق',
        isUseFontSizePrefs: false,
        fontSize: 22.9,
        color: Colors.white,
      ),
      onPressed: () {
        Push.to(context, const AboutDeveloperView());
      },
    );
  }
}
