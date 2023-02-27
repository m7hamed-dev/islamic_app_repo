import 'package:flutter/material.dart';
import 'package:quran/tools/push.dart';
import 'package:quran/views/duaa/duaa_model.dart';
import 'package:quran/widgets/counter_txt.dart';
import 'package:quran/widgets/icon_copy.dart';
import 'package:quran/widgets/icon_goto_screenshot.dart';
import '../views/ramadan/advaice_for_ramadan_view.dart';
import 'icon_share.dart';
import 'icon_warning.dart';

class RowMultiProcess extends StatelessWidget {
  //
  const RowMultiProcess({
    Key? key,
    required this.text,
    required this.title,
    required this.hsna,
    required this.titleFavourit,
    this.isFavouritView,
    this.detailCounter,
    this.isShowAdviceForRamadanIcon,
  }) : super(key: key);
  //
  final String text;
  final String title;
  final String hsna;
  final String titleFavourit;
  final bool? isFavouritView;
  final bool? isShowAdviceForRamadanIcon;
  final Detail? detailCounter;
  //
  @override
  Widget build(BuildContext context) {
    //
    return Container(
      margin: const EdgeInsets.only(top: 10.0),
      child: Column(
        children: [
          const Divider(),
          const SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (detailCounter != null)
                CounterTxt(
                  detail: detailCounter,
                ),
              IconShare(text: text),
              // isFavouritView == true
              //     // mean delete item from faviurite list
              //     ? Consumer<DbHelper>(
              //         builder: (context, dbProvider, _) {
              //           return IconButton(
              //             color: Colors.red.shade100,
              //             padding: EdgeInsets.zero,
              //             // shape: const CircleBorder(),
              //             onPressed: () async {
              //               await dbProvider
              //                   .deleteSingleFavourite(titleFavourit)
              //                   .then((value) {
              //                 dbProvider.fetchFavourites();
              //                 // setState(() {});
              //               });
              //             },
              //             icon: const CircleIcon(
              //               icon: Icons.delete_outline_rounded,
              //             ),
              //           );
              //         },
              //       )
              //     : WidgetAddToFavourit(
              //         favouritModel: FavouritModel(
              //           hsna: hsna,
              //           title: titleFavourit,
              //         ),
              //       ),
              IconCopy(text: text),
              IconWarning(text: text),
              IconGoToScreenShot(text: text, title: title),
              isShowAdviceForRamadanIcon == true
                  ? IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        Push.to(context, const AdvaiceForRamadanView());
                      },
                      icon: const Icon(Icons.app_registration),
                    )
                  : const SizedBox(
                      width: null,
                      height: null,
                    ),
            ],
          ),
        ],
      ),
    );
  }
}
