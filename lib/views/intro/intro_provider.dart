import 'package:flutter/material.dart';
import 'package:quran/models/intro_model.dart';
import 'package:quran/storage/local_storage.dart';
import 'package:quran/storage/storage_interface.dart';

class IntroProvider extends ChangeNotifier with StroageInterface<bool> {
  //
  final List<IntroModel> items = [
    IntroModel(
      tite: 'tite',
      subtite: 'subtite',
      img: 'assets/elqibla/compass.svg',
      color: const Color.fromARGB(255, 162, 123, 4),
    ),
    IntroModel(
      tite: 'tite',
      subtite: 'subtite',
      img: 'assets/elqibla/compass.svg',
      color: const Color.fromARGB(255, 10, 181, 70),
    ),
    IntroModel(
      tite: 'tite',
      subtite: 'subtite',
      img: 'assets/elqibla/compass.svg',
      color: const Color.fromARGB(255, 8, 116, 159),
    ),
  ];

  ///
  int currentIndex = 0;
  void onPageChanged(PageController pageController, int index) {
    currentIndex = index;
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 500),
      curve: Curves.linear,
    );
    notifyListeners();
  }

  @override
  Future<void> setValue(String key, bool value) async {
    LocalStorage.instance.setBool(key, value);
  }

  @override
  Future<bool> getValue(String key) async {
    isShowOnBoradingView = LocalStorage.instance.getBool(key) ?? true;
    return isShowOnBoradingView;
  }

  bool isShowOnBoradingView = true;

  ///
}
