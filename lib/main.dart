import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:provider/provider.dart';
import 'package:quran/home/home_view.dart';
import 'package:quran/storage/local_storage.dart';
import 'package:quran/styles/theme_controller.dart';
import 'package:quran/tools/constants.dart';
import 'package:http/http.dart' as http;
import 'package:quran/widgets/custom_card.dart';
import 'package:quran/widgets/custom_loading.dart';
import 'package:quran/widgets/txt.dart';

import 'views/qari/qari_list_model.dart';

// load some resources
Future<void> initialization(BuildContext? context) async =>
    await Future.delayed(const Duration(seconds: 3));

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  /// init local stoage
  await LocalStorage.init();
  const String locale = 'ar';
  //
  HijriCalendar.setLocal(locale);
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en', 'US'), Locale('ar', 'SAU')],
      path: 'assets/translations',
      fallbackLocale: const Locale('ar', 'SAU'),
      // fallbackLocale: const Locale('en', 'US'),
      child: MultiProvider(
        providers: Constants.providers,
        child: const MyApp(),
      ),
    ),
  );
}

///
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  //

  @override
  Widget build(BuildContext context) {
    //
    return Consumer<ThemeController>(
      builder: (context, value, _) {
        return MaterialApp(
          title: Constants.appName,
          debugShowCheckedModeBanner: false,
          theme: value.initTheme,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          home: const HomeView(),
        );
      },
    );
  }
}

class QariListPage extends StatefulWidget {
  const QariListPage({Key? key}) : super(key: key);

  @override
  State<QariListPage> createState() => _QariListPageState();
}

class _QariListPageState extends State<QariListPage> {
  final _qariList = <QariListModel>[];
  bool _isLoading = true;
  bool _isError = false;
  String _error = '';

  ///
  Future _getQaris() async {
    try {
      final uri = Uri.parse('https://quranicaudio.com/api/qaris');
      final jsonString = await http.get(uri);
      final qariListModel = qariListModelFromJson(jsonString.body);
      for (var qari in qariListModel) {
        _qariList.add(qari);
      }
      _isLoading = false;
      setState(() {});
    } catch (e) {
      if (e is SocketException) {
        _error = 'please Check your internet ';
      }
      _isError = true;
      _isLoading = false;
      setState(() {});
    }
  }

  @override
  void initState() {
    _getQaris();
    super.initState();
  }

  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _isLoading
          ? const CustomLoading()
          : _isError
              ? Center(
                  child: Txt(
                    _error,
                    color: Colors.red,
                    isUseFontSizePrefs: false,
                    fontSize: 25.0,
                  ),
                )
              : ListView.builder(
                  itemCount: _qariList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CustomCard(
                      child: ListTile(
                        title: Txt(_qariList[index].arabicName ?? ''),
                      ),
                    );
                  },
                ),
    );
  }
}

class SurahudioPage extends StatefulWidget {
  const SurahudioPage({Key? key}) : super(key: key);

  @override
  State<SurahudioPage> createState() => SurahAudioPageState();
}

class SurahAudioPageState extends State<SurahudioPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
