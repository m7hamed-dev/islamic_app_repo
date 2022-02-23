import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quran/tools/constants.dart';
import 'package:quran/tools/keys.dart';
import 'package:quran/views/differents_view/differents_view.dart';
import 'package:quran/views/duaa/category_duaa_view.dart';
import 'package:quran/views/favourit/favourit_view.dart';
import 'package:quran/views/hisn/hisn_view.dart';
import 'package:quran/views/music_quran/music_quran_view.dart';
import 'package:quran/views/prayer/prayer_time_view.dart';
import 'package:quran/views/settings/settings_view.dart';
import 'package:quran/views/sibha/sibha_view.dart';
import 'package:quran/views/surah/all_surah_view.dart';
import 'card_home_item.dart';

class HomeWidgets extends StatelessWidget {
  const HomeWidgets({Key? key}) : super(key: key);
  //
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // const SwiperView(),
        Expanded(
          flex: 1,
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: SvgPicture.asset(
              'assets/home/main.svg',
              color: Theme.of(context).primaryColor,

              // width: ScreenUtil.getWidth(context),
              // height: ScreenUtil.getHeight(context) / 2,
              // fit: BoxFit.cover,
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 2.0 / 1.8,
              crossAxisSpacing: 0.0,
              mainAxisSpacing: 0.0,
            ),
            itemCount: _items.length,
            itemBuilder: (BuildContext context, int index) => _items[index],
          ),
        ),
        const SizedBox(height: 20.0)
      ],
    );
  }

  static const List<CardHomeItem> _items = <CardHomeItem>[
    CardHomeItem(
      title: 'all surah',
      image: 'quran_ar.png',
      page: AllSurahView(),
    ),

    CardHomeItem(
      title: 'حصن السملم',
      image: 'azkar.png',
      page: HisnView(),
    ),

    CardHomeItem(
      title: Keys.zkrDuaa,
      image: 'tasbeh.png',
      page: CategoryDuaaView(),
    ),

    CardHomeItem(
      title: Constants.quranListen,
      image: 'azkar.png',
      page: MusicQuranView(),
      isShowIcon: true,
      icon: Icons.music_note_sharp,
    ),

    CardHomeItem(
      title: Keys.prayerTime,
      image: 'praying.png',
      page: PrayerTimeView(),
    ),
    // CardHomeItem(
    //   title: Constants.settings,
    //   image: 'home/settings.png',
    //   page: SettingsView(),
    // ),
    CardHomeItem(
      title: Keys.favourit,
      image: 'home/zkat.jpeg',
      isShowIcon: true,
      icon: Icons.favorite_rounded,
      page: FavouritView(),
    ),
    CardHomeItem(
      title: 'sibha',
      image: 'azkar/sbha.png',
      page: SibhaView(),
    ),
    CardHomeItem(
      title: 'منوعات اسلاميه',
      image: 'home/zkat.jpeg',
      page: DifferentsView(),
    ),
    CardHomeItem(
      title: 'settings',
      image: 'home/zkat.jpeg',
      isShowIcon: true,
      icon: Icons.settings,
      isTransitonFromBottomToUp: true,
      page: SettingsView(),
    ),
  ];
}
