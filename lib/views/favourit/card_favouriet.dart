import 'package:flutter/material.dart';

import '../../widgets/custom_card.dart';
import '../../widgets/row_multi_process.dart';
import '../../widgets/txt.dart';

class CardFavourit extends StatelessWidget {
  const CardFavourit({Key? key, required this.title}) : super(key: key);
  final String title;
  //
  @override
  Widget build(BuildContext context) {
    return CustomCard(
      // padding: Constants.padding,
      // margin: Constants.margin,
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        title: Txt(title),
        subtitle: RowMultiProcess(
          text: title,
          hsna: title,
          titleFavourit: title,
          isFavouritView: true,
          title: 'favouriet',
        ),
      ),
    );
  }
}
