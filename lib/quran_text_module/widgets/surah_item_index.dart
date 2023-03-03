import 'package:flutter/material.dart';

import '../../tools/push.dart';
import '../constant/arabic_sura_number.dart';
import '../constant/surah_builder.dart';
import '../view/constant.dart';

class SurahItemIndex extends StatelessWidget {
  const SurahItemIndex({Key? key, required this.quran}) : super(key: key);
  final List quran;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 114,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return Container(
          color: index.isEven
              ? const Color.fromARGB(255, 253, 247, 230)
              : const Color.fromARGB(255, 253, 251, 240),
          child: TextButton(
            child: Row(
              children: [
                ArabicSuraNumber(i: index),
                const SizedBox(width: 5.0),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [],
                  ),
                ),
                const Expanded(child: SizedBox()),
                Text(
                  arabicName[index]['name'] ?? '',
                  textDirection: TextDirection.rtl,
                ),
              ],
            ),
            onPressed: () {
              final page = SurahBuilder(
                fabIsClicked: false,
                arabic: quran[0],
                sura: index,
                suraName: arabicName[index]['name'] ?? '',
                ayah: 0,
              );
              Push.to(context, page);
            },
          ),
        );
      },
    );
  }
}
