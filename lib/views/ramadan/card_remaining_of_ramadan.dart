import 'package:flutter/material.dart';
import 'package:quran/styles/txt_style.dart';

import '../../tools/hijri_time.dart';
import '../../widgets/blur_widget.dart';

class RemainingRamadanWidget extends StatelessWidget {
  const RemainingRamadanWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlurWidget(
      child: RichText(
        text: TextSpan(
          text: ' المتبقي',
          children: <TextSpan>[
            const TextSpan(
              text: ' لرمضان ',
              style: maraiBlack,
            ),
            TextSpan(
              text: MyHijriCalendar().getRemaingOfRamadn,
              style: maraiBlack,
            ),
            const TextSpan(text: ' يوم'),
          ],
        ),
      ),
    );
  }
}
