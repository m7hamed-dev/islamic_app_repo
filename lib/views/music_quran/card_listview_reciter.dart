import 'package:flutter/material.dart';
import 'package:quran/styles/txt_style.dart';
import 'package:quran/widgets/custom_card.dart';
import 'music_quran_model.dart';

class CardListViewReciter extends StatelessWidget {
  const CardListViewReciter({Key? key, required this.reciter})
      : super(key: key);
  final Reciter reciter;
  //
  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: ListTile(
        title: Text(
          reciter.name,
          style: TxtStyle.customStyle(fontSize: 19.0),
        ),
        subtitle: Text(
          'count ${reciter.count}',
          style: TxtStyle.customStyle(color: Colors.grey),
        ),
      ),
    );
  }
}
