import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran/tools/hide_keyborad.dart';
import 'package:quran/tools/push.dart';
import 'package:quran/tools/surah_logic.dart';
import 'package:quran/views/quran/quran_controller.dart';
import 'package:quran/views/quran/quran_view.dart';
import 'package:quran/views/surah/all_surah_model.dart';
import 'package:quran/widgets/custom_card.dart';
import 'package:quran/widgets/txt.dart';

class CardSurah extends StatelessWidget {
  const CardSurah({
    Key? key,
    required this.surahModel,
  }) : super(key: key);
  final SurahModel surahModel;
  //
  @override
  Widget build(BuildContext context) {
    return CustomCard(
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      child: ListTile(
        onTap: () {
          HideKeyBoard.hide(context);
          context.read<QuranController>().setCurrentPage(surahModel.pages);
          Push.to(context, const QuranView());
        },
        title: Txt(
          surahModel.titleAr,
          color: Theme.of(context).primaryColor,
          isUseFontSizePrefs: false,
          fontSize: 18.0,
        ),
        subtitle: Txt(
          surahModel.title,
          color: Theme.of(context).primaryColor,
          isUseFontSizePrefs: false,
          fontSize: 15.0,
          fontWeight: FontWeight.w500,
        ),
        trailing: Image.asset(
          'assets/arabic_quran/' +
              SurahLogic.getUrlMekiaOrMednia(surahModel.place),
          width: 30.0,
          height: 30.0,
        ),
      ),
    );
  }
}
