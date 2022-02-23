import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran/tools/constants.dart';
import 'package:quran/tools/custom_share.dart';
import 'package:quran/views/irshad/irshad_controller.dart';
import 'package:quran/widgets/custom_card.dart';
import 'package:quran/widgets/txt.dart';
// import 'irshad_model.dart';

class ListviewIrshad extends StatelessWidget {
  const ListviewIrshad({Key? key}) : super(key: key);
  //
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: context.read<IrshadController>().irshads.length,
      itemBuilder: (BuildContext context, int index) {
        return CustomCard(
          margin: const EdgeInsets.all(4.0),
          child: ListTile(
            title: Txt(
              _getTitle(
                context.read<IrshadController>().irshads[index].title,
              ),
            ),
            leading: InkWell(
              child: const Icon(Icons.share),
              onTap: () => CustomShare.shareTxt(
                context.read<IrshadController>().irshads[index].title,
                subject: context.read<IrshadController>().irshads[index].title,
              ),
            ),
          ),
        );
      },
    );
  }

  String _getTitle(String? title) {
    if (title == null || title.isEmpty) {
      return Constants.mohamed;
    }
    return title;
  }
}
