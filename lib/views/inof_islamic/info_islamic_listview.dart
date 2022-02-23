import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran/tools/constants.dart';
import 'package:quran/tools/custom_share.dart';
import 'package:quran/widgets/custom_card.dart';
import 'package:quran/widgets/txt.dart';
import 'info_islamic_controller.dart';

class InfoIslamicListView extends StatelessWidget {
  const InfoIslamicListView({Key? key}) : super(key: key);
  //
  @override
  Widget build(BuildContext context) {
    //
    return ListView.builder(
      itemCount: context.watch<InfoIslamicController>().info.length,
      itemBuilder: (BuildContext context, int index) {
        return CustomCard(
          margin: const EdgeInsets.all(7.0),
          padding: const EdgeInsets.all(5.0),
          child: ListTile(
            // title: Txt('no s: $index'),
            subtitle:
                Txt(context.watch<InfoIslamicController>().info[index].info),
            leading: InkWell(
              child: const Icon(Icons.share),
              onTap: () => CustomShare.shareTxt(
                'context.watch<InfoIslamicController>().info',
                subject: Constants.appLinkOnGooglePlay,
              ),
            ),
          ),
        );
      },
    );
  }
}
