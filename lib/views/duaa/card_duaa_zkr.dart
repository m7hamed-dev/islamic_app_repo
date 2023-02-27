import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran/views/duaa/duaa_controller.dart';
import 'package:quran/widgets/custom_card.dart';
import '../../widgets/row_multi_process.dart';
import '../../widgets/txt.dart';
import 'duaa_model.dart';

class CardDuaaZkr extends StatelessWidget {
  //
  const CardDuaaZkr({
    Key? key,
    required this.detail,
    required this.pageController,
    required this.typeOfDuaa,
  }) : super(key: key);
  //
  final Detail detail;
  final PageController pageController;
  final String typeOfDuaa;
  //
  @override
  Widget build(BuildContext context) {
    //
    return Consumer<DuaaController>(builder: (context, value, _) {
      return CustomCard(
        padding: EdgeInsets.zero,
        onTap: () {
          if (detail.count == 1) {
            pageController.nextPage(
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInToLinear,
            );
          } else if (detail.count > 0) {
            value.decrement(detail);
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 10.0),
              Txt(
                detail.title,
                // color: detail.count == 0 ? Colors.black : Colors.grey,
              ),

              detail.hsna.isNotEmpty ? Column(
                children: [
                  const Divider(),
                  Txt(
                    detail.hsna,
                    isUseFontSizePrefs: false,
                    fontSize: 14.0,
                    // color: Theme.of(context).primaryColor,
                  ),
                ],
              ):  Txt(
                detail.hsna,
                isUseFontSizePrefs: false,
                fontSize: 14.0,
                // color: Theme.of(context).primaryColor,
              ),
              RowMultiProcess(
                text: detail.title,
                hsna: detail.title,
                titleFavourit: detail.title,
                detailCounter: detail,
                title: typeOfDuaa,
              ),
              // CustomLinearProgressIndicator(
              //   currentValue: detail.count,
              // ),
            ],
          ),
        ),
      );
    });
  }
}
