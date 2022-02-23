import 'package:flutter/material.dart';
import 'package:quran/tools/keys.dart';

class ThemeController extends ChangeNotifier {
  // constructor
  ThemeController() {
    // getTheme();
  }
  // ThemeData initTheme = ThemeData.light();
  bool isDark = false;
  //
  // void svaeTheme(bool value) {
  //   isDark = value;
  //   initTheme = multiTheme(isDark);
  //   notifyListeners();
  //   LocalStorage.saveTheme(isDark: isDark);
  // }

  // void getTheme() {
  //   isDark = LocalStorage.getValueOfThemePrfs();
  //   svaeTheme(isDark);
  // }

  final List<String> themeTypes = <String>[Keys.light, Keys.dark];
  //
  final List<Color> colors = const <Color>[
    Color.fromARGB(255, 63, 10, 6),
    Color.fromARGB(255, 3, 47, 5),
    Color.fromARGB(255, 16, 14, 16),
    Color.fromARGB(255, 111, 83, 40),
    Color.fromARGB(255, 116, 10, 81),
    Color.fromARGB(255, 247, 182, 2),
  ];

  void changeThemeMode(int index) {
    debugPrint('index = $index');
    primaryColor = colors[index];
    if (index == 0) {
      isDark = false;
      //
      initTheme = ThemeData(
          primaryColor: primaryColor,
          appBarTheme: AppBarTheme(
            elevation: 10.0,
            centerTitle: true,
            backgroundColor: primaryColor,
            // color: Colors.white,
          ),
          brightness: Brightness.dark,
          iconTheme: IconThemeData(
            color: primaryColor,
          ));
    } else {
      isDark = true;
      //
      initTheme = ThemeData(
          // primaryColor: primaryColor,
          appBarTheme: AppBarTheme(
            elevation: 10.0,
            centerTitle: true,
            // backgroundColor: primaryColor,
            // color: Colors.white,
          ),
          brightness: Brightness.light,
          iconTheme: IconThemeData(
              // color: primaryColor,
              ));
    }
    notifyListeners();
  }

  void changeThemeColor(int index) {
    primaryColor = colors[index];
    //
    initTheme = ThemeData(
        primaryColor: primaryColor,
        appBarTheme: AppBarTheme(
          elevation: 10.0,
          centerTitle: true,
          backgroundColor: primaryColor,
          // color: Colors.white,
        ),
        brightness: Brightness.light,
        iconTheme: IconThemeData(
          color: primaryColor,
        ));
    notifyListeners();
  }

  Color primaryColor = Colors.orange;
  //
  ThemeData initTheme = ThemeData();
  // const Color primaryColor = Constants.myPrimaryColor;
  //
  // ThemeData initTheme = ThemeData(
  //   primaryColor: primaryColor(),
  //   scaffoldBackgroundColor: primaryColor,
  // ).copyWith(
  //   primaryColor: primaryColor,
  //   appBarTheme: AppBarTheme(
  //     elevation: 0.0,
  //     centerTitle: true,
  //     backgroundColor: primaryColor,
  //     // color: Colors.white,
  //   ),
  //   scaffoldBackgroundColor: primaryColor,
  //   // scaffoldBackgroundColor: const Color(0xFFE48873),
  //   textTheme: const TextTheme(
  //     bodyText1: TextStyle(
  //       color: Colors.black,
  //     ),
  //   ),
  // );

  // ThemeData multiTheme(bool isDark) {
  //   if (isDark == false) {
  //     // svaeTheme(false);
  //     notifyListeners();
  //     return ligthTheme;
  //   }
  //   return ThemeData.dark().copyWith(
  //     primaryColor: isDark ? const Color(0xFF1E1E2C) : HexColor('A0522D'),
  //     // primaryColor: isDark ? const Color(0xFF1E1E2C) : HexColor('008A00'),
  //     scaffoldBackgroundColor: isDark ? const Color(0xFF1A1627) : Colors.white,
  //     appBarTheme: AppBarTheme(
  //       color: isDark ? null : Colors.red,
  //       elevation: 0.0,
  //     ),
  //     textTheme: TextTheme(
  //       bodyText1: TextStyle(
  //         color: isDark ? Colors.white : Colors.black,
  //       ),
  //     ),
  //   );
  // }

}
