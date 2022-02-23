import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'duaa_model.dart';

class DuaaController extends ChangeNotifier {
  DuaaController() {
    loadAllDuaa();
  }
  List<DuaaModel> _duaaModel = [];
  List<DuaaModel> searchDuaaModel = [];
  List<DuaaModel> get getListDuaa => _duaaModel;
  //
  Future<void> loadAllDuaa() async {
    String jsonString = await rootBundle.loadString('assets/json/duaa.json');
    final duaaModel = duaaModelFromJson(jsonString);
    searchDuaaModel = _duaaModel = duaaModel;
    notifyListeners();
  }

  String valueDuaa = '';
  //
  void search(String value) {
    valueDuaa = value;
    searchDuaaModel = value.isNotEmpty
        //
        ? _duaaModel.where((DuaaModel duaa) {
            if (duaa.type.contains(value)) {
              return true;
            }
            return false;
          }).toList()
        : _duaaModel;
    notifyListeners();
  }

  ///
  void decrement(Detail detail) {
    if (detail.count > 0) {
      detail.count--;
      notifyListeners();
    }
  }
}
