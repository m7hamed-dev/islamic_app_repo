import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quran/tools/constants.dart';
import 'music_quran_model.dart';
import 'surah_name_mode.dart';

class MusicQuranController extends ChangeNotifier {
  //
  MusicQuranController() {
    getMusicQuran();
    getSurahNameFromJsonString();
  }
  List<Reciter> reciters = <Reciter>[];
  List<Reciter> filtterReciters = <Reciter>[];
  //
  List<String> convetToListOfStrings(String value) {
    var valueWithotComma = value.split(',');
    int length = valueWithotComma.length;
    return List.generate(length, (index) => valueWithotComma[index]).toList();
  }

  final List<String> lettersArabic = [
    'أ',
    'ب',
    'ت',
    'ث',
    'ج',
    'ح',
    'خ',
    'د',
    'ذ',
    'ر',
    'ز',
    'س',
    'ش',
    'ص',
    'ض',
    'ط',
    'ظ',
    'ع',
    'غ',
    'ف',
    'ق',
    'ك',
    'ل',
    'م',
    'ن',
    'ه',
    'و',
    'ي'
  ];

  int selectedLetterIndex = 0;
  void setsSlectedLetterIndex(int index) {
    selectedLetterIndex = index;
    notifyListeners();
  }

  //
  void filter(String value) {
    filtterReciters = value.isEmpty
        ? reciters
        : reciters.where((e) {
            if (e.name.startsWith(value)) {
              return true;
            }
            return false;
          }).toList();
    notifyListeners();
  }

  //
  Future<void> getMusicQuran() async {
    var jsonString =
        await rootBundle.loadString('assets/json/quran_mp3_json.json');
    final musicQuranModel = quranMp3ModelFromJson(jsonString).reciters;
    filtterReciters = reciters = musicQuranModel;
    notifyListeners();
  }

  List<SurahNameModel> surahNameList = <SurahNameModel>[];

  ///
  Future<void> getSurahNameFromJsonString() async {
    var jsonString = await rootBundle.loadString(Constants.surhaNamePath);
    final surahNameModel = surahNameModelFromJson(jsonString);
    surahNameList = surahNameModel;
    notifyListeners();
  }

  String getSurahNameByID(String id) {
    return surahNameList[int.parse(id) - 1].name;
  }
}
