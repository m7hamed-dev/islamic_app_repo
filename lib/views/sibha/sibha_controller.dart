import 'package:flutter/material.dart';
import 'package:quran/storage/local_storage.dart';

class SibhaController extends ChangeNotifier {
  //
  SibhaController() {
    getCustomZikrFromLocal();
    getLastCount();
  }
  String lastZikr = '';
  int count = 0;
  //
  void saveCustomZikrInLocal(String value) {
    lastZikr = value;
    notifyListeners();
    LocalStorage.saveCusomZikr(zkir: lastZikr);
  }

  void getCustomZikrFromLocal() {
    lastZikr = LocalStorage.getCustomZikr();
    notifyListeners();
  }

  void incrementCount() {
    count += 1;
    notifyListeners();
    LocalStorage.saveCountSibha(lastPage: count);
  }

  void getLastCount() {
    count = LocalStorage.getCountSibha();
    notifyListeners();
  }

  void resetCount() {
    LocalStorage.resetCountSibha();
    count = 0;
    notifyListeners();
  }
}
