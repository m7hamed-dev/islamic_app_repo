import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static late SharedPreferences _preferences;
  //
  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();
  //
  static SharedPreferences get instance => _preferences;
  // part font size
  static Future<void> saveFontSize({required double value}) async {
    await _preferences.setDouble('fontSize', value);
  }

  static double getFontSize() {
    return _preferences.getDouble('fontSize') ?? 12.0;
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

  /// quran last surah name
  static Future<void> saveSurahName({required String surahName}) async {
    await _preferences.setString('surah_name', surahName);
  }

  static String get getSurahName => _preferences.getString('surah_name') ?? '';

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

  // // part font types
  // static Future<void> saveFontType({required String value}) async {
  //   debugPrint('font type = $value');
  //   await _preferences.setString('fontTypeKey', value);
  // }
  //
  // static String getFontType() {
  //   return _preferences.getString('fontTypeKey') ?? 'pfd';
  // }

  /// save and get index
  static Future<void> saveIndex(String key, int value) async {
    await _preferences.setInt(key, value);
  }

  static int getIndex(String key) => _preferences.getInt(key) ?? 0;
  static int getInt(String key) => _preferences.getInt(key) ?? 1;

  /// save and get index
  static Future<void> saveBoolean(String key, bool value) async {
    await _preferences.setBool(key, value);
  }

  static bool getBoolean(String key) => _preferences.getBool(key) ?? false;

  /// index font type
  static Future<void> saveIndexOfFontType({required int index}) async {
    // debugPrint('save font index = $value');
    await _preferences.setInt('index_font_type', index);
  }

  static int get getIndexFontType =>
      _preferences.getInt('index_font_type') ?? 0;

  /// switch vibrate

  static clearPrefs() => _preferences.clear();
}
