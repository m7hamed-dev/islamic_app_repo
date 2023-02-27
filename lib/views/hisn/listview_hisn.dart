import 'package:flutter/material.dart';
import 'package:quran/animation/bottom_animation.dart';
import '../../tools/constants.dart';
import 'card_hisn.dart';
import 'hisn_model.dart';

class ListviewHisn extends StatelessWidget {
  const ListviewHisn({Key? key, required this.hisnList}) : super(key: key);
  final List<English> hisnList;
  //
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: Constants.bouncScrollPhysics,
      itemCount: hisnList.length,
      itemBuilder: (BuildContext context, int index) {
        //
        return BottomAnimator(
          time: Duration(milliseconds: index * 5 + 10),
          child: CardHisn(
            title: hisnList[index].title,
            mText: hisnList[index].text,
          ),
        );
      },
    );
  }
}
