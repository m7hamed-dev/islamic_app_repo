import 'package:flutter/material.dart';
import 'package:quran/storage/local_storage.dart';
import 'package:quran/tools/screen_util.dart';

class SettingsController extends ChangeNotifier {
  SettingsController() {
    getFontSize();
    getFontType();
  }
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
      heighBottomNavigation = ScreenUtil.getHeight(context) * .5;
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
    fontType = fontsName[selectedFontTypeIndex];
  }

  int selectedFontTypeIndex = 0;
  //
  final fontsName = <String>['pfd', 'DroidKufi', 'almarai', 'tajawal'];
  //
  void onSelectedFontType(int _index) {
    selectedFontTypeIndex = _index;
    // LocalStorage.saveFontType(value: fontsName[index]);
    LocalStorage.saveIndexOfFontType(index: _index);
    getFontType();
    notifyListeners();
  } //

  List<String> fontsSize = <String>['صغير', 'متوسط', 'كبير', 'كبير جدا'];

  /// part lang
  void getLang() {
    fontSize = LocalStorage.getFontSize();
  }

  /// part index of font type
  int get getIndexOfFontTypeFromPrefs => LocalStorage.getIndexFontType;
}
