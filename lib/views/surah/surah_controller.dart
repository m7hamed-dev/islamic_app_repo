import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'all_surah_model.dart';

class SurahController extends ChangeNotifier {
  SurahController() {
    loadListSurah();
  }
  //
  List<SurahModel> listSurah = <SurahModel>[];
  List<SurahModel> searchlistSurah = <SurahModel>[];
  //
  String getSurahName(int index) {
    return '';
    // return listSurah[index].chapters[0].nameComplex;
  }

  //
  Future<void> loadListSurah() async {
    listSurah.length = 0;
    String jsonString = await rootBundle.loadString('assets/json/surah.json');
    final allSurahModel = surahModelFromJson(jsonString);
    searchlistSurah = listSurah = allSurahModel;
    notifyListeners();
  }

  // final TextEditingController textEditingController = TextEditingController();
  String searchValue = '';
  // search
  void onChane(String value) {
    searchValue = value;
    return search(searchValue);
  }

  //
  void search(String value) {
    // textEditingController.text = value;
    searchValue = value;
    searchlistSurah = value.isNotEmpty
        ? listSurah.where((suhra) {
            if (suhra.titleAr.contains(value)) {
              return true;
            }
            return false;
          }).toList()
        : listSurah;
    notifyListeners();
  }

  void clearTexr() {
    searchValue = '';
    notifyListeners();
  }

  void filtteSurahByPlace(String value) {
    switch (value) {
      case 'Medina':
        // searchlistSurah.length = 0;
        searchlistSurah = value.isNotEmpty
            ? listSurah.where((suhra) {
                if (suhra.place == 'Medina') {
                  // CustomToast.show('item : ${searchlistSurah.length}');
                  return true;
                }
                return false;
              }).toList()
            : listSurah;
        // notifyListeners();
        break;
      case 'Mecca':

        // searchlistSurah.length = 0;
        searchlistSurah = value.isNotEmpty
            ? listSurah.where((suhra) {
                if (suhra.place == 'Mecca') {
                  return true;
                }
                return false;
              }).toList()
            : listSurah;
        // notifyListeners();
        break;
      default:
        searchlistSurah = listSurah;
      // notifyListeners();
    }
    notifyListeners();
  }
}
