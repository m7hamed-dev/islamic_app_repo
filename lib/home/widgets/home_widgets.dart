import 'package:flutter/material.dart';
import 'package:quran/home/widgets/header.dart';
import 'package:quran/tools/constants.dart';
import 'package:quran/views/duaa/category_duaa_view.dart';
import 'package:quran/views/irshad/irshad_view.dart';
import 'package:quran/views/quiez/quiez_view.dart';
import 'package:quran/views/quran/quran_online_view.dart';
import 'package:quran/widgets/background_image_widget.dart';
import '../../views/prayer/prayer_time.dart';
import '../../views/surah/all_surah_view.dart';
import 'card_home_item.dart';

class HomeWidgets extends StatefulWidget {
  const HomeWidgets({Key? key}) : super(key: key);
  @override
  State<HomeWidgets> createState() => _HomeWidgetsState();

  static const _items = <CardHomeItem>[
    CardHomeItem(
      title: 'pdf - القرآن',
      image: 'quran',
      page: AllSurahView(),
    ),
    CardHomeItem(
      title: 'القرآن أون لاين',
      image: 'quran_ar',
      page: QuranOnlineView(),
    ),
    // CardReadQuranOnlinePdf(),
    // CardHomeItem(
    //   title: 'حصن المسلم',
    //   image: 'quran',
    //   page: HisnView(),
    // ),
    CardHomeItem(
      title: 'آزكار',
      image: 'praying',
      page: CategoryDuaaView(),
    ),
    CardHomeItem(
      title: 'مواقيت الصلاة',
      image: 'mosque',
      page: PrayTimes(),
    ),
    // CardHomeItem(
    //   title: 'إنجازاتك',
    //   image: 'awards',
    //   page: AchievementsView(),
    // ),
    // CardHomeItem(
    //   title: 'السبحة',
    //   image: 'beads',
    //   page: SibhaView(),
    // ),
    // CardHomeItem(
    //   title: 'رمضانيات ',
    //   image: 'no',
    //   page: RamadanView(),
    // ),
    CardHomeItem(
      title: 'أسئلة',
      image: 'conversation',
      isTransitonFromBottomToUp: true,
      page: QuiezView(),
    ),
    CardHomeItem(
      title: 'نصائح - إرشادات',
      image: 'chat',
      page: IrshadView(),
    ),
  ];
}

class _HomeWidgetsState extends State<HomeWidgets> {
  @override
  Widget build(BuildContext context) {
    return BackGroundImageWidget(
      child: CustomScrollView(
        // padding: const EdgeInsets.all(8.0),
        physics: Constants.bouncScrollPhysics,
        slivers: [
          //
          const SliverToBoxAdapter(child: Header()),
          //
          // const SliverToBoxAdapter(
          //   child: AsmaAllahView(),
          // ),
          //
          //
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 150.0,
              mainAxisSpacing: 0.0,
              crossAxisSpacing: 0.0,
              childAspectRatio: 1.0,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return HomeWidgets._items[index];
              },
              childCount: HomeWidgets._items.length,
            ),
          )
        ],
      ),
    );
  }
}
