import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static late SharedPreferences _preferences;
  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();
  // part font size
  static Future<void> saveFontSize({required double value}) async {
    await _preferences.setDouble('fontSize', value);
  }

  static double getFontSize() {
    return _preferences.getDouble('fontSize') ?? 13.0;
  }

  /// part theme

  static Future<void> saveTheme({required bool isDark}) async {
    await _preferences.setBool('key_theme', isDark);
  }

  static bool getValueOfThemePrfs() {
    return _preferences.getBool('key_theme') ?? false;
  }

  /// quran last page
  static Future<void> saveLastQuranPage({required int lastPage}) async {
    await _preferences.setInt('last_quran_page', lastPage);
  }

  static int getLastQuranPage() {
    return _preferences.getInt('last_quran_page') ?? 1;
  }

  /// quran last page
  static Future<void> saveReadingQuranPage({required int lastPage}) async {
    await _preferences.setInt('reading_last_quran_page', lastPage);
  }

  static int getLastReadingQuranPage() {
    return _preferences.getInt('reading_last_quran_page') ?? 1;
  }

  // save custom zikr
  static Future<void> saveCusomZikr({required String zkir}) async {
    await _preferences.setString('custom_zkir', zkir);
  }

  static String getCustomZikr() {
    return _preferences.getString('custom_zkir') ?? '';
  }

  // quran last page
  static Future<void> saveCountSibha({required int lastPage}) async {
    await _preferences.setInt('last_count_sibha', lastPage);
  }

  static int getCountSibha() {
    return _preferences.getInt('last_count_sibha') ?? 0;
  }

  static void resetCountSibha() async {
    await _preferences.setInt('last_count_sibha', 0);
  }

  /// score part
  static Future<void> saveTotalScore({required int scoreValue}) async {
    await _preferences.setInt('count_scroe', scoreValue);
  }

  static int getTotalScore() {
    return _preferences.getInt('count_scroe') ?? 0;
  }

  static Future<void> saveLastIndexOfQuestion({required int value}) async {
    await _preferences.setInt('last_question', value);
  }

  static int getLastQuestion() {
    return _preferences.getInt('last_question') ?? 0;
  }

  // part font types
  static Future<void> saveFontType({required String value}) async {
    await _preferences.setString('fontTypeKey', value);
  }

  static String getFontType() {
    return _preferences.getString('fontTypeKey') ?? 'pfd';
  }

  /// save and get index
  static Future<void> saveIndex(String key, int value) async {
    await _preferences.setInt(key, value);
  }

  static int getIndex(String key) => _preferences.getInt(key) ?? 0;

  // save coach maker
  static Future<void> isShowCochMaker(String key, bool value) async {
    await _preferences.setBool(key, value);
  }

  static bool getValueOfCochMaker(String key) =>
      _preferences.getBool(key) ?? true;
}
