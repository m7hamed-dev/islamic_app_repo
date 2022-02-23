import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:quran/home/home_view.dart';
import 'package:quran/styles/txt_style.dart';
import 'package:quran/widgets/btn.dart';

class LanguageView extends StatefulWidget {
  const LanguageView({Key? key}) : super(key: key);
  static const pageName = '/lang_view';
  @override
  State<LanguageView> createState() => _LanguageViewState();
}

class _LanguageViewState extends State<LanguageView> {
  //
  bool isArabic = true;
  void onSelectedLang(bool lang) {
    isArabic = lang;
    setState(() {});
  }

  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Select Lang',
              style: TxtStyle.customStyle(fontSize: 40.0),
            ),
            Btn(
              child: const Text("arabic"),
              onPressed: () {
                EasyLocalization.of(context)!
                    .setLocale(const Locale('ar', 'SA'));
              },
            ),
            Btn(
              child: const Text("english"),
              onPressed: () {
                EasyLocalization.of(context)!
                    .setLocale(const Locale('en', 'US'));

                Navigator.pushNamed(context, HomeView.pageName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
