import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:quran/home/home_controller.dart';
import 'package:quran/providers/on_boardong_provider.dart';
import 'package:quran/styles/theme_controller.dart';
import 'package:quran/tools/play_music_provider.dart';
import 'package:quran/views/calc_zkat/zkat_controller.dart';
import 'package:quran/views/duaa/duaa_controller.dart';
import 'package:quran/views/hisn/slider_husn.dart';
import 'package:quran/views/inof_islamic/info_islamic_controller.dart';
import 'package:quran/views/irshad/irshad_controller.dart';
import 'package:quran/views/music_quran/music_quran_controller.dart';
import 'package:quran/views/prayer/prayer_controller.dart';
import 'package:quran/views/quiez/quiez_controller.dart';
import 'package:quran/views/quran/quran_controller.dart';
import 'package:quran/views/settings/settings_controller.dart';
import 'package:quran/views/sibha/sibha_controller.dart';
import 'package:quran/views/surah/surah_controller.dart';

import '../views/lang/lang_controller.dart';

class Constants {
  static const String appName = 'quran';
  static const String appLinkOnGooglePlay = 'quran - app .com';
  // all messages app
  static const String internetErro = 'internetErro';
  //
  // padding and margin
  static const double padding = 5.0;
  static const double margin = 5.0;
  static const double cornerRadius = 10.0;
  // all paths
  static const String quranPath = 'assets/pdf/quran.pdf';
  static const String surhaNamePath = 'assets/json/surah_name_json.json';
  static const String dataBaseName = "favorit_db.db";
  // 'https://api.pray.zone/v2/times/today.json?city=khartoum';
  static const int lengthZkr = 4;
  static const int totalSurah = 114;

  /// style
  static HexColor myPrimaryColor = HexColor('#16033a');
  // static const Color myPrimaryColor = Color.fromARGB(255, 73, 3, 130);
  static const Color color1 = Color(0xFF8000e8);
  static const Color color2 = Color(0xFF34009b);
  static const Color color3 = Color(0xFF8133d4);
  static Color customGrey = HexColor('#ffffff');
  static Color customDarkBlue = HexColor('#03173a');
  // all provider
  static final List<SingleChildWidget> providers = [
    ChangeNotifierProvider<ThemeController>(
      create: (_) => ThemeController(),
    ),
    ChangeNotifierProvider<HomeController>(
      create: (_) => HomeController(),
    ),
    ChangeNotifierProvider<SettingsController>(
      create: (_) => SettingsController(),
    ),
    ChangeNotifierProvider<DuaaController>(
      create: (_) => DuaaController(),
    ),
    // ChangeNotifierProvider<IrshadController>(
    //   create: (_) => IrshadController(),
    // ),
    ChangeNotifierProvider<QuranController>(
      create: (_) => QuranController(),
    ),
    ChangeNotifierProvider<SurahController>(
      create: (_) => SurahController(),
    ),
    ChangeNotifierProvider<PrayerController>(
      create: (_) => PrayerController(),
    ),
    ChangeNotifierProvider<MusicQuranController>(
      create: (_) => MusicQuranController(),
    ),
    ChangeNotifierProvider<SibhaController>(
      create: (_) => SibhaController(),
    ),
    ChangeNotifierProvider<InfoIslamicController>(
      create: (_) => InfoIslamicController(),
    ),
    ChangeNotifierProvider<QuiezController>(
      create: (_) => QuiezController(),
    ),
    ChangeNotifierProvider<ZkatController>(
      create: (_) => ZkatController(),
    ),
    ChangeNotifierProvider<SliderController>(
      create: (_) => SliderController(),
    ),

    ChangeNotifierProvider<IrshadController>(
      create: (_) => IrshadController(),
    ),
    ChangeNotifierProvider<PlayMusicProvider>(
      create: (_) => PlayMusicProvider(),
    ),
    ChangeNotifierProvider<LangController>(
      create: (_) => LangController(),
    ),
    ChangeNotifierProvider<OnBoardingProvider>(
      create: (_) => OnBoardingProvider(),
    ),
    // FutureProvider<List<IrshadModel>>(
    //   create: (_) => Future.value(IrshadController().futureData()),
    //   initialData: const [],
    // ),
    // FutureProvider<IrshadController>(
    //   create: (_) => Future.value(IrshadController()),
    //   initialData: IrshadController(),
    // )
  ];
  // all page names
  static const quranListen = 'quran - listen';
  static const quranRead = 'القران الكريم';
  static const qibla = 'القبلة';
  static const sibha = 'سبحه الكترونيه';

  static const calZkat = 'cal - zkat';
  static const settings = 'الاعدادات';
  static const infoIslamic = 'معلومات اسلاميه';

  ///
  static const mohamed =
      'إِنَّ اللَّهَ وَمَلَائِكَتَهُ يُصَلُّونَ عَلَى النَّبِيِّ يَا أَيُّهَا الَّذِينَ آمَنُوا صَلُّوا عَلَيْهِ وَسَلِّمُوا تَسْلِيمًا';
}
