import 'package:flutter/material.dart';
import 'package:quran/tools/push.dart';
import 'package:quran/widgets/custom_card.dart';
import 'package:quran/widgets/txt.dart';
import 'hisn_model.dart';
import 'listview_title_hisn_view.dart';

class CardHisn extends StatelessWidget {
  const CardHisn({
    Key? key,
    required this.title,
    required this.mText,
  }) : super(key: key);
  //
  final String title;
  final List<MText> mText;
  //
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Push.to(
          context,
          ListViewTitleHisnView(
            title: title,
            listMTxt: mText,
          )),
      child: CustomCard(
        child: Txt(title,



            isUseFontSizePrefs: false,
            ),
      ),
    );
  }
}
