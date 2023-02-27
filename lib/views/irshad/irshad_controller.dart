import 'package:flutter/material.dart';
import 'package:quran/global/future_string.dart';
import 'irshad_model.dart';

class IrshadController extends ChangeNotifier {
  IrshadController() {
    debugPrint('IrshadController() is creation ...... ');
    futureData();
  }
  List<IrshadModel> irshads = <IrshadModel>[];
  List<IrshadModel> irshadsSwiperList = <IrshadModel>[];
  //
  Future<void> futureData() async {
    final data = await FutureString.from('assets/json/irshad.json');
    irshads = irshadModelFromJson(data);
    _irshadForSwiperList();
  }

  String _currentTitle = '';
  String get currentTitle => _currentTitle;

  void _irshadForSwiperList() {
    for (var i = 0; i < 10; i++) {
      irshadsSwiperList.add(irshads[i]);
      _currentTitle = irshads[i].title;
    }
    notifyListeners();
  }
}
