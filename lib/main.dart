import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:quran/constants/app_assets.dart';
import 'package:quran/home/home_view.dart';
import 'package:quran/storage/local_storage.dart';
import 'package:quran/styles/theme_controller.dart';
import 'package:quran/tools/constants.dart';
import 'package:http/http.dart' as http;
import 'package:quran/tools/push.dart';
import 'package:quran/widgets/btn.dart';
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
  // const String locale = 'ar';
  //
  // HijriCalendar.setLocal(locale);
  runApp(
    MultiProvider(
      providers: Constants.providers,
      child: const MyApp(),
    ),
    // EasyLocalization(
    //   supportedLocales: const [Locale('en', 'US'), Locale('ar', 'SAU')],
    //   path: 'assets/translations',
    //   fallbackLocale: const Locale('ar', 'SAU'),
    //   // fallbackLocale: const Locale('en', 'US'),
    //   child: MultiProvider(
    //     providers: Constants.providers,
    //     child: const MyApp(),
    //   ),
    // ),
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
          // localizationsDelegates: context.localizationDelegates,
          // supportedLocales: context.supportedLocales,
          // locale: context.locale,
          // home: const OnBoardingPage(),
          home: const HomeView(),
        );
      },
    );
  }
}

class OnBoardingModel {
  ///
  const OnBoardingModel({
    required this.title,
    required this.subtitle,
    required this.image,
    required this.color,
  });

  ///
  final String title;
  final String subtitle;
  final String image;
  final Color color;
}

class OnBoardingDots extends StatelessWidget {
  const OnBoardingDots({
    Key? key,
    required this.count,
    required this.currentIndex,
  }) : super(key: key);

  ///
  final int currentIndex;
  final int count;

  ///
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(count, (index) {
        return Container(
          width: 10.0,
          height: 10.0,
          margin: const EdgeInsets.symmetric(horizontal: 4.0),
          decoration: BoxDecoration(
            shape: currentIndex == index ? BoxShape.circle : BoxShape.rectangle,
            color: currentIndex == index
                ? Colors.white
                : Colors.white.withOpacity(.5),
          ),
        );
      }).toList(),
    );
  }
}

class OnBoardingBtn extends StatelessWidget {
  OnBoardingBtn({
    Key? key,
    required this.currentIndex,
    required this.pageController,
  }) : super(key: key);

  ///
  int currentIndex;
  final PageController pageController;

  ///
  @override
  Widget build(BuildContext context) {
    // if (currentIndex == 0) {
    return Row(
      children: [
        Expanded(
          child: Btn(
            child: const Txt('next'),
            onPressed: () {
              pageController.animateToPage(
                currentIndex += 1,
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOut,
              );
            },
          ),
        ),
        _icon(),
      ],
    );
    // }
    return Btn(
      child: const Txt('finish'),
      onPressed: () => Push.to(context, const HomeView()),
    );
  }

  _icon() {
    if (currentIndex == 2) {
      return const Icon(Icons.arrow_back);
    }
    return const Icon(Icons.arrow_forward);
  }
}

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  late PageController pageController;
  late int currentIndex;
  @override
  void initState() {
    currentIndex = 0;
    pageController = PageController(initialPage: currentIndex);
    contents = [
      OnBoardingModel(
        title: 'التطبيق يحتوي علي',
        subtitle: '',
        image: AppAssets.onboardingOne,
        color: HexColor('#feda9e'),
      ),
      OnBoardingModel(
        title: 'رمضانيات',
        subtitle: '',
        image: AppAssets.onBoardingTow,
        color: HexColor('#90e8d0'),
      ),
      const OnBoardingModel(
        title: 'أسئلة',
        subtitle: 'يحتوي التطبيق علي أسئلة دينية',
        image: AppAssets.style,
        color: Color.fromARGB(255, 246, 90, 142),
      ),
    ];
    super.initState();
  }

  late List<OnBoardingModel> contents;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 600),
        color: contents[currentIndex].color,
        child: Stack(
          children: [
            ///
            Positioned(
              top: 0,
              bottom: 250,
              left: 0,
              right: 0,
              child: PageView.builder(
                controller: pageController,
                itemCount: contents.length,
                onPageChanged: (page) {
                  currentIndex = page;
                  setState(() {});
                },
                itemBuilder: (context, index) =>
                    Image.asset(contents[index].image),
              ),
            ),

            ///
            Positioned(
              bottom: 20,
              left: 10,
              right: 10,
              child: Column(
                children: [
                  Txt(contents[currentIndex].title),
                  const SizedBox(height: 10.0),
                  OnBoardingDots(
                    count: contents.length,
                    currentIndex: currentIndex,
                  ),
                  const SizedBox(height: 10.0),
                  OnBoardingBtn(
                    currentIndex: currentIndex,
                    pageController: pageController,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
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
