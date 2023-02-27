import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'duaa_model.dart';

class DuaaController extends ChangeNotifier {
  DuaaController() {
    loadAllDuaa();
  }
  List<DuaaModel> _categories = [];
  List<DuaaModel> get categories => _categories;
  //
  Future<void> loadAllDuaa() async {
    String jsonString = await rootBundle.loadString('assets/json/duaa.json');
    final duaaModel = duaaModelFromJson(jsonString);
    _categories = duaaModel;
    notifyListeners();
  }

  String valueDuaa = '';
  //

  int _currentCounter = 0;
  int get currentCounter => _currentCounter;

  ///
  void decrement(Detail detail) {
    if (detail.count > 0) {
      _currentCounter = detail.count;
      detail.count--;
      notifyListeners();
    }
  }

  // late Detail category;
  // late String categoryName;

  // ///
  // void selectedSingleCategory(int index) {
  //   category = _categories[index].details[index];
  //   categoryName = _categories[index].type;
  //   notifyListeners();
  // }
}
