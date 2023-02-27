import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:quran/storage/local_storage.dart';

import '../../tools/constants.dart';

class QuranController extends ChangeNotifier {
  int currentPage = 0;
  String currentSurahName = '';
  //
  void setCurrentPage(int page) {
    currentPage = page;
    debugPrint('currentPage :: $currentPage');
    // notifyListeners();
  }

  void changeNightMode(bool value) {
    // isReadingNigthMode =  value ;
    if (isReadingNigthMode != value) {
      return;
    }
    value = !value;
    notifyListeners();
  }

  bool isReadingNigthMode = false;
  //

  Widget pdf() {
    return PDF(
      enableSwipe: true,
      swipeHorizontal: true,
      autoSpacing: false,
      nightMode: isReadingNigthMode,
      // pageFling: false,
      // preventLinkNavigation: false,
      // pageSnap: false,
      defaultPage: currentPage,
      fitEachPage: true,
      // nightMode: true,
      onViewCreated: (PDFViewController pdfViewController) {
        debugPrint('pdfViewController ${pdfViewController.getCurrentPage()}');
      },
      onError: (error) {
        debugPrint('onError $error');
      },
      onPageError: (page, error) {
        debugPrint('onPageError $error');
      },
      onPageChanged: (int? page, int? total) {
        currentPage = page ?? 1;
        debugPrint('page change: $page/$total');
      },
    ).fromAsset(Constants.quranPath);
  }

  static int lastPage = 1;

  //
  void saveBookMark(int page, String surahName) {
    // if (currentPage == page) {
    //   return;
    // }
    LocalStorage.saveReadingQuranPage(lastPage: page);
    LocalStorage.saveSurahName(surahName: surahName);
    debugPrint('page = $page');
  }

  void getLastReadingPage() {
    currentPage = LocalStorage.getLastReadingQuranPage();
    currentSurahName = LocalStorage.getSurahName;
    debugPrint('getLastReadingPage() =  $currentPage');
    // notifyListeners();
  }

  //
  void onPageChanged(int page) {
    lastPage = page;
  }

  // Future<bool> hasSupport() async {
  //   DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  //   AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
  //   bool hasSupport = androidInfo.version.sdkInt >= 21;
  //   return hasSupport;
  // }
}
