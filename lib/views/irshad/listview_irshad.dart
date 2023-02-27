import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran/tools/constants.dart';
import 'package:quran/views/irshad/irshad_controller.dart';
import 'package:quran/views/irshad/irshad_model.dart';
import 'package:quran/widgets/custom_card.dart';
import 'package:quran/widgets/row_multi_process.dart';
import 'package:quran/widgets/txt.dart';

import '../../animation/bottom_animation.dart';
import '../../global/empty_list_widget.dart';

///
class ListviewIrshad extends StatelessWidget {
  const ListviewIrshad({Key? key}) : super(key: key);

  //
  @override
  Widget build(BuildContext context) {
    return Consumer<IrshadController>(
      builder: (context, irshadController, _) {
        return EmptyListWidget<IrshadModel>().checkList(
          irshadController.irshads,
          ListView.builder(
            physics: Constants.bouncScrollPhysics,
            // itemExtent: 100,
            shrinkWrap: true,
            // controller: scrollController,
            itemCount: irshadController.irshads.length,
            itemBuilder: (BuildContext context, int index) {
              return BottomAnimator(
                time: Duration(milliseconds: 300 + index * 3),
                child: CustomCard(
                  height: 100,
                  // margin: Constants.margin,
                  // padding: Constants.padding,
                  child: Column(
                    children: [
                      Title(txt: irshadController.irshads[index].title),
                      RowMultiProcess(
                        text: irshadController.irshads[index].title,
                        hsna: '',
                        titleFavourit: irshadController.irshads[index].title,
                        title: '😍 نصائح وإرشادات 😍',
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

class Title extends StatelessWidget {
  const Title({Key? key, required this.txt}) : super(key: key);
  final String txt;

  @override
  Widget build(BuildContext context) {
    return Txt(
      txt,
      // txt ?? Constants.mohamed,
      // color: ThemeController().seletedIndexOfColor != 100
      //     ? Theme.of(context).primaryColor
      //     : Colors.black,
    );
  }
}
