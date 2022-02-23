import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:quran/storage/local_storage.dart';
import 'package:quran/tools/constants.dart';

class QuranController extends ChangeNotifier {
  //
  QuranController() {
    debugPrint('instance from');
  }
  int currentPage = 0;
  //
  void setCurrentPage(int page) {
    currentPage = page;
    debugPrint('currentPage :: $currentPage');
    notifyListeners();
  }

  //
  Widget pdf() {
    return PDF(
      enableSwipe: true,
      swipeHorizontal: true,
      autoSpacing: false,
      // pageFling: false,
      // preventLinkNavigation: false,
      // pageSnap: false,
      defaultPage: currentPage,
      fitEachPage: false,
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

  // Widget pdfOnline(String url) {
  //   // return const PDF().fromUrl(
  //   return const PDF().fromAsset(
  //     url,
  //     errorWidget: (dynamic error) => Center(child: Text(error.toString())),
  //   );
  // }

  static int lastPage = 1;

  //
  void saveBookMark(int page) {
    LocalStorage.saveReadingQuranPage(lastPage: page);
    debugPrint('page = $page');
  }

  void getLastReadingPage() {
    currentPage = LocalStorage.getLastReadingQuranPage();
    notifyListeners();
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
