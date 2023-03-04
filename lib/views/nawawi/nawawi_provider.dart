import 'package:flutter/material.dart';

import '../../global/future_string.dart';
import 'nawawi_model.dart';

class NawawiProvider extends ChangeNotifier {
  NawawiProvider() {
    getData();
  }
  bool isLoading = false;
  List<NawawiModel> nawawis = [];
  Future getData() async {
    isLoading = true;
    String jsonString =
        await FutureString.from('assets/json/hadith-nawawi.json');
    nawawis = nawawiModelFromJson(jsonString);
    isLoading = false;
    notifyListeners();
  }
}
