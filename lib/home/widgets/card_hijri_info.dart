import 'package:flutter/material.dart';
import 'package:quran/widgets/txt.dart';
import '../../tools/hijri_time.dart';
import '../../widgets/blur_widget.dart';

class CardHijriCalender extends StatelessWidget {
  const CardHijriCalender({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (MyHijriCalendar().thisMonthIsRamdan) {
      return const SizedBox(width: null, height: null);
    }

    return BlurWidget(
      child: Row(
        children: [
          const SizedBox(width: 10.0),
          Image.asset(
            'assets/home/calendar.png',
            width: 33.0,
            height: 33.0,
          ),
          const SizedBox(width: 10.0),
          Txt(
            MyHijriCalendar().getFullDateName,
            isUseFontSizePrefs: false,
            fontSize: 17.0,
            color: Colors.black,
          ),
          const SizedBox(width: 10.0),
        ],
      ),
    );
  }
}
