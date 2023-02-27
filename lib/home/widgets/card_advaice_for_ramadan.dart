import 'dart:math';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../animation/bottom_animation.dart';
import '../../global/depency_injection.dart';
import '../../tools/screen_util.dart';
import '../../widgets/row_multi_process.dart';
import '../../widgets/txt.dart';

class CardAdvaiceForRamadan extends StatelessWidget {
  const CardAdvaiceForRamadan({
    Key? key,
    required List<String> advaiceRamadan,
  })  : _advaiceRamadan = advaiceRamadan,
        super(key: key);

  final List<String> _advaiceRamadan;

  @override
  Widget build(BuildContext context) {
    //
    return Container(
      height: ScreenUtil.getHeight(context) * 0.24,
      padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 4.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: DI.themeController(context, isListen: true).isDarkTheme
            ? HexColor('#444d56')
            : DI.primaryColor(context).withOpacity(.1),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.black.withOpacity(.5),
        //     blurRadius: 5.0,
        //     spreadRadius: 5.0,
        //     // offset: const Offset(2.0, 2.4),
        //   )
        // ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12.0,
          vertical: 4.0,
        ),
        title: BottomAnimator(
          time: const Duration(milliseconds: 400),
          child: Txt(
            _advaiceRamadan[Random().nextInt(_advaiceRamadan.length - 1)],
            isUseFontSizePrefs: false,
            fontSize: 13.0,
            textAlign: TextAlign.center,
            color: DI.themeController(context).isDarkTheme
                ? Colors.white
                : Colors.black,
          ),
        ),
        leading: Image.asset(
          // 'assets/home/mos.jpg',
          'assets/home/ramadan.png',
          height: 50.0,
        ),
        subtitle: BottomAnimator(
          time: const Duration(milliseconds: 600),
          child: RowMultiProcess(
            text: _advaiceRamadan[Random().nextInt(_advaiceRamadan.length - 1)],
            title: 'نصائح رمضانيه',
            hsna: '',
            titleFavourit: '',
            isShowAdviceForRamadanIcon: true,
          ),
        ),
      ),
    );
  }
}
