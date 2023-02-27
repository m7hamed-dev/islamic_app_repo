import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran/widgets/app_bar_title.dart';
import 'package:quran/widgets/listview_surah.dart';
import 'package:quran/widgets/mecca_img.dart';
import '../../tools/push.dart';
import '../../widgets/icon_leading.dart';
import '../../widgets/madina_img.dart';
import '../quran/quran_controller.dart';
import '../quran/quran_view.dart';
import 'surah_controller.dart';

class AllSurahView extends StatelessWidget {
  const AllSurahView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const AppBarTitle('السور'),
          actions: const [ItemsAppBar()],
          // shape: CustomAppBarShape(),
          leading: const IconLeading(),
        ),
        body: const ListViewSurah(),
      ),
    );
  }
}

class ItemsAppBar extends StatelessWidget {
  const ItemsAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            context.read<SurahController>().filtteSurahByPlace('Mecca');
          },
          icon: const MeccaImg(),
        ),
        IconButton(
          onPressed: () {
            context.read<SurahController>().filtteSurahByPlace('Medina');
          },
          icon: const MdinaImg(),
        ),
        IconButton(
          onPressed: () {
            context.read<SurahController>().filtteSurahByPlace('all');
          },
          icon: const Icon(Icons.done_all_outlined),
        ),
        // const SearchIcon(),
        // IconButton(
        //   onPressed: () {
        //     showSearch(
        //       context: context,
        //       delegate: SurahSearchDelegate(
        //         list: context.read<SurahController>().searchlistSurah,
        //         // childResult: cardsu ,
        //       ),
        //     );
        //   },
        //   icon: const Icon(Icons.search),
        // ),
        IconButton(
          onPressed: () {
            final quranController = context.read<QuranController>();
            quranController.getLastReadingPage();
            Push.to(context,
                QuranView(surahName: quranController.currentSurahName));
          },
          icon: const Icon(Icons.bookmark_added_rounded),
        )
      ],
    );
  }
}
