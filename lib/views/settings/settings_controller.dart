import 'package:flutter/material.dart';
import 'package:quran/storage/local_storage.dart';

class SettingsController extends ChangeNotifier {
  SettingsController() {
    getFontSize();
  }
  double heighBottomNavigation = 0.0;
  double fontSize = 14.0;

  void changeFontSize(double value) {
    fontSize = value;
    notifyListeners();
    LocalStorage.saveFontSize(value: value);
  }

  void getFontSize() {
    fontSize = LocalStorage.getFontSize();
  }

  int selectedFontTypeIndex = 0;
  //
  //
  void onSelectedFontType(int index) {
    selectedFontTypeIndex = index;
    LocalStorage.saveIndexOfFontType(index: index);
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
