// import 'package:flutter/material.dart';
// import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
// // import 'package:native_pdf_view/native_pdf_view.dart';
// import 'package:quran/storage/local_storage.dart';
// import 'package:quran/tools/constants.dart';

// class QiblahController extends ChangeNotifier {
//   //
//   QiblahController() {
//     debugPrint('instance from quran controller ......');
//     // initPDF();
//   }
//   int currentPage = 0;
//   //
//   void setCurrentPage(int page) {
//     currentPage = page;
//     debugPrint('currentPage :: $currentPage');
//     notifyListeners();
//   }

//   // late PdfControllerPinch _pdfController;
//   // //
//   // void initPDF(int page) {
//   //   _pdfController = PdfControllerPinch(
//   //     document: PdfDocument.openAsset(Constants.quranPath),
//   //     initialPage: page - 569,
//   //     // initialPage: 569 - page,
//   //   );
//   // }

//   // Widget pdf2() {
//   //   return PdfViewPinch(
//   //     documentLoader: const Center(child: CircularProgressIndicator()),
//   //     pageLoader: const Center(child: CircularProgressIndicator()),
//   //     controller: _pdfController,
//   //     scrollDirection: Axis.vertical,
//   //     pageSnapping: false,
//   //     onDocumentLoaded: (document) {
//   //       // debugPrint('total ${document.pagesCount}');
//   //       // setState(() {
//   //       // currentPage = document.pagesCount;
//   //       // notifyListeners();
//   //       // });
//   //     },
//   //     onPageChanged: (page) {
//   //       currentPage = page;
//   //       // notifyListeners();
//   //       // setCurrentPage(page);
//   //       // setState(() {
//   //       // _actualPageNumber = page;
//   //       // });
//   //     },
//   //   );
//   // }

//   Widget pdf() {
//     return PDF(
//       enableSwipe: true,
//       swipeHorizontal: true,
//       autoSpacing: false,
//       // pageFling: false,
//       // preventLinkNavigation: false,
//       // pageSnap: false,
//       defaultPage: currentPage,
//       fitEachPage: false,
//       // nightMode: true,
//       onViewCreated: (PDFViewController pdfViewController) {
//         debugPrint('pdfViewController ${pdfViewController.getCurrentPage()}');
//       },
//       onError: (error) {
//         debugPrint('onError $error');
//       },
//       onPageError: (page, error) {
//         debugPrint('onPageError $error');
//       },
//       onPageChanged: (int? page, int? total) {
//         currentPage = page ?? 1;
//         debugPrint('page change: $page/$total');
//       },
//     ).fromAsset(Constants.quranPath);
//   }

//   // Widget pdfOnline(String url) {
//   //   // return const PDF().fromUrl(
//   //   return const PDF().fromAsset(
//   //     url,
//   //     errorWidget: (dynamic error) => Center(child: Text(error.toString())),
//   //   );
//   // }

//   static int lastPage = 1;

//   //
//   void saveBookMark(int page) {
//     LocalStorage.saveReadingQuranPage(lastPage: page);
//     debugPrint('page = $page');
//   }

//   void getLastReadingPage() {
//     currentPage = LocalStorage.getLastReadingQuranPage();
//     notifyListeners();
//   }

//   //
//   void onPageChanged(int page) {
//     lastPage = page;
//   }

//   // Future<bool> hasSupport() async {
//   //   DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
//   //   AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
//   //   bool hasSupport = androidInfo.version.sdkInt >= 21;
//   //   return hasSupport;
//   // }

// }
