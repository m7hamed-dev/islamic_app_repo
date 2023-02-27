import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:quran/home/home_controller.dart';
import 'package:quran/styles/theme_controller.dart';
import 'package:quran/views/calc_zkat/zkat_controller.dart';
import 'package:quran/views/duaa/duaa_controller.dart';
import 'package:quran/views/inof_islamic/info_islamic_controller.dart';
import 'package:quran/views/irshad/irshad_controller.dart';
import 'package:quran/views/music_quran/music_quran_controller.dart';
import 'package:quran/views/prayer/prayer_controller.dart';
import 'package:quran/views/quiez/quiez_controller.dart';
import 'package:quran/views/quran/quran_controller.dart';
import 'package:quran/views/settings/settings_controller.dart';
import 'package:quran/views/sibha/sibha_controller.dart';
import 'package:quran/views/surah/surah_controller.dart';
import '../global/quran_controller_api.dart';
import '../global/vibrate_apis.dart';
import '../views/intro/intro_provider.dart';
import '../views/prayer/location_serivce.dart';
import '../views/ramadan/ramadan_controller.dart';

class Constants {
  //
  static const appName = 'خطى إسلامية';
  //
  static const linkAppInGoolePlayStore =
      'https://play.google.com/store/apps/details?id=com.awseforapps.khota.islamia';
  //
  // all messages app
  static const processSuccess = 'تمت بنجاح ';
  // static const internetErro = 'internetErro';
  // padding
  static const EdgeInsets padding = EdgeInsets.all(14.0);
  //
  static const EdgeInsets paddingHomeView = EdgeInsets.all(14.0);
  //
  static const EdgeInsets marginHomeView =
      EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0);
  // margin
  static const EdgeInsets margin =
      EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0);
  //
  static const double cornerRadius = 10.0;
  static const double txtFontSize = 14.0;
  static const double fontSizeForSettingsTxt = 18.0;
  // all paths
  static const quranPath = 'assets/pdf/quran.pdf';
  static const surhaNamePath = 'assets/json/surah_name_json.json';
  static const dataBaseName = "favorit_db.db";
  // 'https://api.pray.zone/v2/times/today.json?city=khartoum';
  static const int lengthZkr = 4;
  static const int totalSurah = 114;

  // all provider
  static final List<SingleChildWidget> providers = [
    //
    ChangeNotifierProvider<RamadanController>(
      create: (_) => RamadanController(),
    ),
    //
    ChangeNotifierProvider<QuranAPI>(
      create: (_) => QuranAPI(),
    ),
    ChangeNotifierProvider<VibrateAPIsProvider>(
      create: (_) => VibrateAPIsProvider(),
    ),
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
    ChangeNotifierProvider<IntroProvider>(
      create: (_) => IntroProvider(),
    ),
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
    // ChangeNotifierProvider<SliderController>(
    //   create: (_) => SliderController(),
    // ),

    ChangeNotifierProvider<IrshadController>(
      create: (_) => IrshadController(),
    ),
    ChangeNotifierProvider<LocationServiceProvider>(
      create: (_) => LocationServiceProvider(),
    ),
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

  /// listview properties
  static const bouncScrollPhysics = BouncingScrollPhysics();
}
