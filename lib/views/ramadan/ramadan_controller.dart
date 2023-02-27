import 'package:flutter/material.dart';
import 'package:quran/global/future_string.dart';
import '../../models/ramadan_model.dart';

class RamadanController extends ChangeNotifier {
  //
  RamadanController() {
    fetchBenefits();
  }
  //
  final benefits = <RamadanModel>[];
  //
  Future<void> fetchBenefits() async {
    final _jsonString = await FutureString.from('assets/json/ramadan.json');
    final _benefits = ramadanModelFromJson(_jsonString);
    benefits.addAll(_benefits);
    notifyListeners();
  }
}
