import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran/home/home_view.dart';
import 'package:quran/router/app_route.dart';
import 'package:quran/storage/local_storage.dart';
import 'package:quran/styles/theme_controller.dart';
import 'package:quran/tools/constants.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:quran/views/quiez/quiez_view.dart';

// load some resources
Future<void> initialization(BuildContext? context) async =>
    await Future.delayed(const Duration(seconds: 3));

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  AssetsAudioPlayer.setupNotificationsOpenAction((notification) => true);
  FlutterNativeSplash.removeAfter(initialization);
  await LocalStorage.init();
  // final _db =await DbHelper.init(); _db.delete('favorits_table');
  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('ar', 'SA'),
      ],
      path: 'assets/translations',
      fallbackLocale: const Locale('ar', 'SA'),
      child: MultiProvider(
        providers: Constants.providers,
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  //
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeController>(
      builder: (context, value, _) {
        return MaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          title: Constants.appName,
          debugShowCheckedModeBanner: false,
          theme: value.initTheme,
          onGenerateRoute: AppRoute.router,
          // initialRoute: HomeView.pageName
          initialRoute: QuiezView.pageName,
        );
      },
    );
  }
}
