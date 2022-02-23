import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
        return ListView.builder(
          itemCount: controller.searchlistSurah.length,
          itemBuilder: (BuildContext context, int index) {
            return CardSurah(surahModel: controller.searchlistSurah[index]);
          },
        );
      },
    );
  }
}
