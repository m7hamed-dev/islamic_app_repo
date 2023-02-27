import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran/global/empty_list_widget.dart';
import 'package:quran/tools/constants.dart';
import 'package:quran/views/surah/all_surah_model.dart';
import 'package:quran/views/surah/card_surah.dart';
import 'package:quran/views/surah/surah_controller.dart';

class ListViewSurah extends StatelessWidget {
  const ListViewSurah({Key? key}) : super(key: key);
  //
  @override
  Widget build(BuildContext context) {
    //
    return Consumer<SurahController>(
      builder: (context, SurahController controller, _) {
        return EmptyListWidget<SurahModel>().checkList(
          controller.listSurah,
          ListView.builder(
            shrinkWrap: true,
            physics: Constants.bouncScrollPhysics,
            // itemExtent: 200,
            // controller: _scrollController,
            itemCount: controller.searchlistSurah.length,
            itemBuilder: (BuildContext context, int index) {
              return CardSurah(
                index: index,
                surahModel: controller.searchlistSurah[index],
              );
            },
          ),
        );
      },
    );
  }
}
