import 'package:flutter/material.dart';

class ZkrController extends ChangeNotifier {
  //
  int count = 0;

  decrementCount(zkrModel) {
    zkrModel.count--;
    notifyListeners();
  }
}
