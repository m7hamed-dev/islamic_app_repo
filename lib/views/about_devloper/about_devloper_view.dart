import 'package:flutter/material.dart';
import 'package:quran/animation/bottom_animation.dart';
import 'package:quran/tools/constants.dart';
import 'package:quran/tools/screen_util.dart';
import 'package:quran/widgets/app_bar_title.dart';
import 'package:quran/widgets/btn.dart';
import 'package:quran/widgets/icon_leading.dart';
import 'package:quran/widgets/listtile_setting.dart';
import 'package:quran/widgets/txt.dart';

import '../../tools/custom_share.dart';

class AboutDeveloperView extends StatelessWidget {
  const AboutDeveloperView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarTitle('عن التطبيق'),
        leading: const IconLeading(),
      ),
      body: ListView(
        physics: Constants.bouncScrollPhysics,
        children: [
          Image.asset(
            'assets/logo.png',
            height: ScreenUtil.getHeight(context) / 3,
          ),
          const Txt(
            'تطبيق خطي اسلاميه',
            isUseFontSizePrefs: false,
            fontSize: 18.9,
            textAlign: TextAlign.center,
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Txt(
              'تطبيق يحتوي علي مجموعه واسعه من الاسلاميات من قرآن كريم واحاديث وسبحه الخ',
              isUseFontSizePrefs: false,
              fontSize: 18.9,
              textAlign: TextAlign.center,
            ),
          ),
          // Image.asset('assets/logo.png'),
          const ListTileSetting(
            title: 'contact',
            subtitle: Txt(
              'moh94syed@gmail.com',
              isUseFontSizePrefs: false,
              fontSize: 18.9,
            ),
            icon: Icons.email_rounded,
          ),
          Btn(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            margin: const EdgeInsets.only(bottom: 20.0),
            child: const Txt(
              'مشاركة التطبيق',
              isUseFontSizePrefs: false,
              fontSize: 22.9,
              color: Colors.white,
            ),
            onPressed: () {
              const txtShare = '''
${Constants.appName} \n
تطبيق يحتوي علي مجموعه اسلاميه من قراءة قرآن كريم اذكار المسلم تسبيح اسئله دينيه معلومات اسلاميه كما يمكنك من مشاركة كل هذه الاشياء مع اصدقائك
ساهم في نشر التطبيق فالدال على الخير كفاعله
 رابط التحميل: 
 ${Constants.linkAppInGoolePlayStore}
 ''';
              CustomShare.shareTxt(txtShare);
            },
          ),
        ].map((e) {
          return Container(
            margin: const EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 10.0,
            ),
            child: BottomAnimator(
              time: const Duration(milliseconds: 300),
              child: e,
            ),
          );
        }).toList(),
      ),
    );
  }
}
