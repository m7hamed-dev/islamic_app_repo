import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:quran/quran_text_module/view/constant.dart';
import 'package:quran/storage/local_storage.dart';

class ThemeController extends ChangeNotifier {
  // constructor
  ThemeController() {
    getThemeIndex();
    changeThemeColor(selectedIndexOfColor);
  }

  //
  final List<Color> colors = const <Color>[
    Color.fromARGB(255, 63, 10, 0),
    Color.fromARGB(255, 63, 10, 6),
    Color.fromARGB(255, 35, 6, 35),
    Color.fromARGB(255, 111, 83, 40),
    Color.fromARGB(255, 103, 60, 12),
    Color.fromARGB(255, 198, 13, 136),
    Color.fromARGB(255, 165, 16, 153),
    Color.fromARGB(255, 205, 151, 5),
    Color.fromARGB(255, 205, 151, 90),
    Color.fromARGB(255, 22, 89, 144),
    Color.fromARGB(255, 6, 58, 101),
    Color.fromARGB(255, 13, 162, 7),
    Color.fromARGB(255, 8, 138, 4),
    Color.fromARGB(255, 58, 21, 146),
  ];

  int selectedIndexOfColor = 0;
  //
  void getThemeIndex() {
    selectedIndexOfColor = LocalStorage.getIndex('theme_index_key');
  }

  void saveThemeIndex(int index) =>
      LocalStorage.saveIndex('theme_index_key', selectedIndexOfColor);

  ThemeData initTheme = ThemeData();
  Brightness _brightness = Brightness.light;
  Color primaryColor = Colors.orange;
  //
  bool isLightTheme = false;
  //
  void changeThemeColor(int index) {
    //
    try {
      if (index == 100) {
        _brightness = Brightness.dark;
        selectedIndexOfColor = index;
        initTheme = _darkTheme();
        notifyListeners();
        isLightTheme = false;
        saveThemeIndex(selectedIndexOfColor);
      } else {
        primaryColor = colors[index];
        selectedIndexOfColor = index;
        _brightness = Brightness.light;
        initTheme = _lightTheme();
        notifyListeners();
        isLightTheme = true;
        saveThemeIndex(selectedIndexOfColor);
      }
    } catch (e) {
      primaryColor = colors[0];
      selectedIndexOfColor = 0;
      _brightness = Brightness.light;
      initTheme = _lightTheme();
      notifyListeners();
      isLightTheme = true;
      saveThemeIndex(selectedIndexOfColor);
      debugPrint('catch error on changeThemeColor $e');
    }
    // debugPrint('selectedIndexOfColor = $selectedIndexOfColor');
  }

  ThemeData _lightTheme() {
    return ThemeData(
      fontFamily: 'Almarai',
      primaryColor: primaryColor,
      scaffoldBackgroundColor: backgroundColor,
      useMaterial3: true,
      appBarTheme: AppBarTheme(
        // color: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: primaryColor,
      ),
      brightness: _brightness,
      iconTheme: IconThemeData(
        color: primaryColor,
      ),
    );
  }

  ThemeData _darkTheme() {
    return ThemeData(
      fontFamily: 'Almarai',
      useMaterial3: true,
      scaffoldBackgroundColor: HexColor('##1c2939'),
      appBarTheme: AppBarTheme(
        color: HexColor('#16202a'),
        elevation: 0.0,
        centerTitle: true,
      ),
      brightness: _brightness,
      iconTheme: IconThemeData(color: primaryColor),
    );
  }

  bool get isDarkTheme => selectedIndexOfColor == 100 ? true : false;
  //
  Color txtColor(BuildContext context, Color? color) {
    if (color != null) {
      return color;
    }
    if (isDarkTheme) {
      return HexColor('#ffffff');
    }
    return Theme.of(context).primaryColor;
  }
}
