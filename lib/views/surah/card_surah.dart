import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran/tools/hide_keyborad.dart';
import 'package:quran/tools/surah_logic.dart';
import 'package:quran/views/quran/quran_controller.dart';
import 'package:quran/views/quran/quran_view.dart';
import 'package:quran/views/surah/all_surah_model.dart';
import 'package:quran/widgets/custom_card.dart';
import 'package:quran/widgets/txt.dart';

import '../../animation/bottom_animation.dart';
import '../../animation/transition_animation.dart';

class CardSurah extends StatelessWidget {
  const CardSurah({
    Key? key,
    required this.surahModel,
    required this.index,
  }) : super(key: key);
  final SurahModel surahModel;
  final int index;
  //
  @override
  Widget build(BuildContext context) {
    return BottomAnimator(
      time: Duration(milliseconds: 300 + index),
      child: CustomCard(
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          onTap: () {
            HideKeyBoard.hide(context);
            final _quranController = context.read<QuranController>();
            _quranController.setCurrentPage(surahModel.pages);
            transitionAnimation.fromBottomToTop(
              context: context,
              goToPage: QuranView(surahName: ' سورة ' + surahModel.titleAr),
            );
          },
          title: Txt(
            surahModel.titleAr,
            isUseFontSizePrefs: false,
            fontSize: 20.0,
          ),
          subtitle: Txt(
            surahModel.title,
            isUseFontSizePrefs: false,
            fontSize: 13.0,
            fontWeight: FontWeight.w500,
          ),
          leading: CircleAvatar(
            backgroundColor: Theme.of(context).primaryColor.withOpacity(.09),
            child: Txt(
              '${index + 1} ',
              isUseFontSizePrefs: false,
              fontSize: 15.0,
              fontWeight: FontWeight.w500,
              textAlign: TextAlign.center,
            ),
          ),
          trailing: Image.asset(
            'assets/arabic_quran/' +
                SurahLogic.getUrlMekiaOrMednia(surahModel.place),
            width: 30.0,
            height: 30.0,
          ),
        ),
      ),
    );
  }
}
