import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran/animation/bottom_animation.dart';
import 'package:quran/widgets/custom_card.dart';
import 'package:quran/widgets/txt.dart';
import '../../widgets/row_multi_process.dart';
import 'info_islamic_controller.dart';

class InfoIslamicListView extends StatelessWidget {
  const InfoIslamicListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<InfoIslamicController>(
      builder: (context, controller, _) {
        return ListView.builder(
          itemCount: controller.info.length,
          itemBuilder: (BuildContext context, int index) {
            return BottomAnimator(
              time: Duration(milliseconds: index * 10),
              child: CustomCard(
                // margin: Constants.margin,
                // padding: Constants.padding,
                child: ListTile(
                  title: Txt(
                    controller.info[index].info,
                    textAlign: TextAlign.center,
                  ),
                  subtitle: RowMultiProcess(
                    title: ' معلومات إسلاميه ',
                    text: controller.info[index].info,
                    hsna: '',
                    titleFavourit: controller.info[index].info,
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
