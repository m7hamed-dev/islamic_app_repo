import 'package:flutter/material.dart';
import 'package:quran/animation/bottom_animation.dart';
import 'package:quran/widgets/app_bar_title.dart';
import 'package:quran/widgets/custom_card.dart';
import 'package:quran/widgets/row_multi_process.dart';
import 'package:quran/widgets/txt.dart';
import '../../tools/constants.dart';
import 'hisn_model.dart';

class ListViewTitleHisnView extends StatelessWidget {
  //
  const ListViewTitleHisnView({
    Key? key,
    required this.listMTxt,
    required this.title,
  }) : super(key: key);
  //
  final List<MText> listMTxt;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppBarTitle(title),
      ),
      body: ListView.builder(
        physics: Constants.bouncScrollPhysics,
        itemCount: listMTxt.length,
        itemBuilder: (BuildContext context, int index) {
          return BottomAnimator(
            time: Duration(milliseconds: 10 * index + 10),
            child: CustomCard(
              padding: EdgeInsets.zero,
              child: Column(
                children: [
                  Txt(
                    listMTxt[index].arabicText,
                    isUseFontSizePrefs: false,
                    fontSize: 20.0,
                    textAlign: TextAlign.center,
                    fontFamily: 'tajawal',
                  ),
                  const Divider(),
                  Txt(
                    listMTxt[index].translatedText,
                    isUseFontSizePrefs: false,
                    fontSize: 16.0,
                    textAlign: TextAlign.center,
                    // color: DI.primaryColor(context).withOpacity(.8),
                  ),
                  RowMultiProcess(
                    text: title,
                    title: 'hisn in english',
                    hsna: '',
                    titleFavourit: title,
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
