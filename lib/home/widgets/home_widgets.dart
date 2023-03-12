import 'package:flutter/material.dart';
import 'package:quran/constants/app_assets.dart';
import 'package:quran/home/widgets/header.dart';
import 'package:quran/quran_text_module/view/constant.dart';
import 'package:quran/quran_text_module/view/index.dart';
import 'package:quran/tools/constants.dart';
import 'package:quran/views/duaa/category_duaa_view.dart';
import 'package:quran/views/irshad/irshad_view.dart';
import 'package:quran/views/nawawi/nawawi_view.dart';
import 'package:quran/views/quiez/quiez_view.dart';
import '../../views/surah/all_surah_view.dart';
import 'card_home_item.dart';

class HomeWidgets extends StatefulWidget {
  const HomeWidgets({Key? key}) : super(key: key);
  @override
  State<HomeWidgets> createState() => _HomeWidgetsState();
}

class _HomeWidgetsState extends State<HomeWidgets> {
  static final _items = <CardHomeItem>[
    CardHomeItem(
      title: 'pdf - القرآن',
      image: AppAssets.redQuran,
      page: const AllSurahView(),
      color: blueColor,
    ),
    CardHomeItem(
      title: 'القرآن أون لاين',
      // image: 'quran_ar',
      image: AppAssets.redQuran,
      page: const IndexPage(),
      color: redColor,
    ),

    CardHomeItem(
      title: 'آزكار',
      // image: 'praying',
      image: AppAssets.redQuran,
      page: const CategoryDuaaView(),
      color: greenColor,
    ),
    // CardHomeItem(
    //   title: 'مواقيت الصلاة',
    //   // image: 'mosque',
    //   image: AppAssets.redQuran,
    //   page: const PrayTimes(),
    //   color: blueColor,
    // ),
    CardHomeItem(
      title: 'الآربعون نووية',
      // image: 'mosque',
      image: AppAssets.redQuran,
      page: const NawawisView(),
      color: blueColor,
    ),
    // CardHomeItem(
    //   title: 'إنجازاتك',
    //   image: 'awards',
    //   page: AchievementsView(),
    // ),
    // CardHomeItem(
    //   title: 'رمضانيات ',
    //   image: 'no',
    //   page: RamadanView(),
    // ),
    CardHomeItem(
      title: 'أسئلة',
      // image: 'conversation',
      image: AppAssets.redQuran,
      isTransitonFromBottomToUp: true,
      page: const QuiezView(),
      color: blueColor,
    ),
    CardHomeItem(
      title: 'نصائح - إرشادات',
      // image: 'chat',
      image: AppAssets.redQuran,
      page: const IrshadView(),
      color: blueColor,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      // padding: const EdgeInsets.all(8.0),
      physics: Constants.bouncScrollPhysics,
      slivers: [
        const SliverAppBar(
          expandedHeight: 220.0,
          collapsedHeight: 60.0,
          flexibleSpace: FlexibleSpaceBar(
            background: Header(),
            // title: Txt('خطي إسلامية'),
          ),
          pinned: true,
          floating: true,
        ),
        //
        //   child: AsmaAllahView()
        SliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            // childAspectRatio: 2.0 / 2.4,
          ),
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return _items[index];
            },
            childCount: _items.length,
          ),
        )
      ],
    );
  }
}
