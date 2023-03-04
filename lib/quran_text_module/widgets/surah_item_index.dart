import 'package:flutter/material.dart';
import 'package:quran/styles/txt_style.dart';
import 'package:quran/widgets/custom_card.dart';

import '../../tools/push.dart';
import '../constant/arabic_sura_number.dart';
import '../constant/surah_builder.dart';
import '../view/constant.dart';

class SurahItemIndex extends StatelessWidget {
  const SurahItemIndex({Key? key, required this.quran}) : super(key: key);
  final List quran;
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return CustomCard(
            color: index.isEven
                ? const Color.fromARGB(255, 253, 247, 230)
                : const Color.fromARGB(255, 216, 215, 210),
            child: ListTile(
              onTap: () {
                final page = SurahBuilder(
                  fabIsClicked: false,
                  arabic: quran[0] ?? [0],
                  sura: index,
                  suraName: arabicName[index]['name'] ?? '',
                  ayah: 0,
                );
                Push.to(context, page);
              },
              contentPadding: EdgeInsets.zero,
              leading: ArabicSuraNumber(i: index),
              title: Text(
                arabicName[index]['name'] ?? '',
                textDirection: TextDirection.rtl,
                style: maraiBlack,
              ),
              subtitle: Text(
                arabicName[index]['name'] ?? '',
                textDirection: TextDirection.rtl,
              ),
            ),
          );
        },
        childCount: 114,
      ),
    );
  }
}
