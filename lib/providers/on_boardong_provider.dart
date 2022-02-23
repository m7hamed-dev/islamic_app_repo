import 'package:flutter/material.dart';
import 'package:quran/models/on_boarding_model.dart';

class OnBoardingProvider extends ChangeNotifier {
  final List<OnBoardingModel> items = [
    OnBoardingModel(
      tite: 'quran app',
      subtite: 'subtite',
      img: 'assets/intro/1.png',
    ),
    OnBoardingModel(
      tite: 'second',
      subtite: 'subtite',
      img: 'assets/intro/1.png',
    ),
    OnBoardingModel(
      tite: 'third',
      subtite: 'subtite',
      img: 'assets/intro/1.png',
    ),
  ];

  //
  int selectedIndex = 0;
  int get getSelectedIndex => selectedIndex;
  //
  void onPageChanged(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}
