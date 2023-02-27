import 'package:flutter/material.dart';
import 'package:quran/home/home_view.dart';
import 'package:quran/views/quiez/quiez_view.dart';
import '../views/quran/quran_view.dart';

class AppRoute {
  static Route? router(RouteSettings routeSettings) {
    debugPrint('current view = ${routeSettings.name}');
    switch (routeSettings.name) {
      case '/':
        MaterialPageRoute(
          builder: (context) {
            return const HomeView();
          },
        );

        return MaterialPageRoute(
          builder: (context) {
            return const HomeView();
          },
        );
      // case HisnView.pageName:
      //   return MaterialPageRoute(
      //     builder: (context) {
      //       return const HisnView();
      //     },
      //   );
      // case FavouritView.pageName:
      //   return MaterialPageRoute(
      //     builder: (context) {
      //       return const FavouritView();
      //     },
      //   );
      case QuranView.pageName:
        return MaterialPageRoute(
          builder: (context) {
            return const QuranView(surahName: '');
          },
        );

      case QuiezView.pageName:
        return MaterialPageRoute(
          builder: (context) {
            return const QuiezView();
          },
        );

      // case QiblahView.pageName:
      //   return MaterialPageRoute(
      //     builder: (context) {
      //       return const QiblahView();
      //     },
      //   );

      default:
        return MaterialPageRoute(
          builder: (context) {
            return const HomeView();
          },
        );
    }
  }
}
