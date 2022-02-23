import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran/storage/local_storage.dart';
import 'package:quran/tools/screen_util.dart';

class SettingsController extends ChangeNotifier {
  // constructor
  SettingsController() {
    getFontSize();
    getFontType();
    getSavedIndexOfLang();
  }
  // bottom navigatoin
  double heighBottomNavigation = 0.0;
  double fontSize = 14.0;
  bool isShowNavBottomSettings = false;

  void changeFontSize(double value) {
    fontSize = value;
    notifyListeners();
    LocalStorage.saveFontSize(value: value);
  }

  void changeStateNavBottomSettings(BuildContext context) {
    isShowNavBottomSettings = !isShowNavBottomSettings;
    if (isShowNavBottomSettings) {
      heighBottomNavigation = ScreenUtil.getHeight(context) / 2;
    } else {
      heighBottomNavigation = ScreenUtil.getHeight(context) * 0.0;
    }
    notifyListeners();
  }

  void getFontSize() {
    fontSize = LocalStorage.getFontSize();
  }

  String fontType = 'pfd';
  //
  void getFontType() {
    fontType = LocalStorage.getFontType();
  }

  //
  List<String> fontsName = <String>['pfd', 'cairo', 'almarai', 'tajawal'];
  //
  void onSeletedFontType(int index) {
    LocalStorage.saveFontType(value: fontsName[index]);
    getFontType();
    notifyListeners();
  } //

  List<String> fontsSize = <String>['small', 'medium', 'large'];

  void onSeletedFontSize(BuildContext context, int index) {
    double _fontSizeProvider = context.read<SettingsController>().fontSize;
    switch (index) {
      case 0:
        _fontSizeProvider = 12.0;
        break;
      case 1:
        _fontSizeProvider = 16.0;
        break;
      case 2:
        _fontSizeProvider = 20.0;
        break;
    }
    changeFontSize(_fontSizeProvider);
  }

  /// part lang
  void getLang() {
    fontSize = LocalStorage.getFontSize();
  }

  bool isArabic = true;
  Locale currentLocale = const Locale('ar', 'SA');
  //
  void changeLang(BuildContext context, bool value) {
    isArabic = value;
    debugPrint('isArabic = $isArabic');
    if (isArabic) {
      currentLocale = const Locale('ar', 'SA');
      EasyLocalization.of(context)!.setLocale(currentLocale);
    } else {
      currentLocale = const Locale('en', 'US');
      EasyLocalization.of(context)!.setLocale(currentLocale);
    }
    notifyListeners();
  }

  int savedLangIndex = 0;
  void getSavedIndexOfLang() {
    savedLangIndex = LocalStorage.getIndex('lnag_key');
    debugPrint('saved index of lang ${LocalStorage.getIndex('lnag_key')}');
  }
}
