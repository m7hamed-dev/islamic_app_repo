import 'package:flutter/material.dart';
import 'package:quran/home/home_view.dart';
import 'package:quran/views/favourit/favourit_view.dart';
import 'package:quran/views/quiez/quiez_view.dart';
import '../views/hisn/hisn_view.dart';
import '../views/intro/onboarding_view.dart';
import '../views/lang/language_view.dart';
import '../views/quran/quran_view.dart';

class AppRoute {
  static Route? router(RouteSettings routeSettings) {
    debugPrint('current view = ${routeSettings.name}');
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) {
            return const HomeView();
          },
        );
      case HisnView.pageName:
        return MaterialPageRoute(
          builder: (context) {
            return const HisnView();
          },
        );
      case FavouritView.pageName:
        return MaterialPageRoute(
          builder: (context) {
            return const FavouritView();
          },
        );
      case QuranView.pageName:
        return MaterialPageRoute(
          builder: (context) {
            return const QuranView();
          },
        );
      case LanguageView.pageName:
        return MaterialPageRoute(
          builder: (context) {
            return const LanguageView();
          },
        );
      case QuiezView.pageName:
        return MaterialPageRoute(
          builder: (context) {
            return const QuiezView();
          },
        );
      case OnBoardingView.pageName:
        return MaterialPageRoute(
          builder: (context) {
            return const OnBoardingView();
          },
        );

      default:
        return MaterialPageRoute(
          builder: (context) {
            return const LanguageView();
          },
        );
    }
  }
}
