import 'package:flutter/material.dart';
import 'card_hisn.dart';
import 'hisn_model.dart';

class ListviewHisn extends StatelessWidget {
  const ListviewHisn({Key? key, required this.hisnList}) : super(key: key);
  final List<English> hisnList;
  //
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: hisnList.length,
      itemBuilder: (BuildContext context, int index) {
        return CardHusn(
          title: hisnList[index].title,
          // repeat: hisnList[index].repeat ?? 1,
          mText: hisnList[index].text,
        );
      },
    );
  }
}
