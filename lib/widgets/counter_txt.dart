import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran/animation/bottom_animation.dart';
import 'package:quran/tools/convert_to_arabic_num.dart';
import 'package:quran/views/duaa/duaa_controller.dart';
import '../views/duaa/duaa_model.dart';
import 'txt.dart';

class CounterTxt extends StatelessWidget {
  const CounterTxt({Key? key, this.detail}) : super(key: key);
  final Detail? detail;
  @override
  //
  Widget build(BuildContext context) {
    if (detail == null) {
      return const SizedBox();
    }
    return Consumer<DuaaController>(
      builder: (_, count, __) {
        final count = ConvertTo.toArabicNumber('${detail!.count}');
        //
        return BottomAnimator(
          time: const Duration(milliseconds: 460),
          child: Txt(
            count,
            fontSize: 19.0,
            isUseFontSizePrefs: false,
          ),
        );
      },
    );
  }
}
