import 'package:flutter/material.dart';
import 'package:quran/tools/push.dart';
import 'package:quran/widgets/custom_card.dart';
import 'package:quran/widgets/txt.dart';
import 'hisn_model.dart';
import 'listview_title_hisn_view.dart';

class CardHusn extends StatelessWidget {
  const CardHusn({
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
      onTap: () => Push.to(context, ListViewTitleHisnView(listMTxt: mText)),
      child: CustomCard(
        margin: const EdgeInsets.all(5.0),
        padding: const EdgeInsets.all(5.0),
        child: ListTile(
          // contentPadding: EdgeInsets.zero,
          title: Txt(
            title,
            // style: TxtStyle.customStyle(),
          ),
          // subtitle: Txt('repeat $repeat'),
        ),
      ),
    );
  }
}
