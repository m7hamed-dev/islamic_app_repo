import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran/views/duaa/duaa_controller.dart';
import 'package:quran/views/favourit/favourit_model.dart';
import 'package:quran/widgets/custom_card.dart';
import 'package:quran/widgets/icon_copy.dart';
import 'package:quran/widgets/icon_share.dart';
import 'package:quran/widgets/liner_progress_indicator.dart';
import 'package:quran/widgets/widget_add_to_favourite.dart';
import '../../widgets/txt.dart';
import 'duaa_model.dart';

class CardDuaaZkr extends StatelessWidget {
  const CardDuaaZkr({Key? key, required this.detail}) : super(key: key);
  final Detail detail;
  //
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.read<DuaaController>().decrement(detail),
      child: CustomCard(
        padding: const EdgeInsets.all(10.0),
        margin: const EdgeInsets.symmetric(vertical: 4.9),
        child: Column(
          children: [
            const SizedBox(height: 10.0),
            _buildCountOrDone(),
            const SizedBox(height: 10.0),
            CustomLinearProgressIndicator(
              currentValue: detail.count / 100.0,
            ),
            const SizedBox(height: 20.0),
            Txt(
              detail.title,
              color: detail.count == 0 ? Colors.black : Colors.grey,
            ),
            Txt(
              detail.hsna,
              color: Theme.of(context).primaryColor,
            ),
            SizedBox(height: detail.hsna.isEmpty ? 0.0 : 10.0),
            // CstmDiv(),
            _row(context.watch<DuaaController>()),
          ],
        ),
      ),
    );
  }

  Widget _buildCountOrDone() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 800),
      height: detail.count == 0 ? 0.0 : 40.0,
      child: Txt(
        detail.count == 0 ? 'تم' : '${detail.count}',
        fontSize: detail.count == 0 ? 16.0 : 40.0,
        color: detail.count == 0 ? Colors.green : Colors.red,
        isUseFontSizePrefs: false,
      ),
    );
  }

  AnimatedContainer _row(DuaaController duaaController) {
    return AnimatedContainer(
      // height: detail.count == 0 ? 50.0 : 90.0,
      duration: const Duration(milliseconds: 950),
      // alignment: Alignment.center,
      padding: const EdgeInsets.all(0.0),
      // decoration: BoxDecoration(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconShare(text: detail.title),
          WidgetAddToFavourit(
            favouritModel: FavouritModel(
              title: detail.title,
              hsna: detail.hsna,
            ),
          ),
          IconCopy(text: detail.title),
        ],
      ),
    );
  }
}
