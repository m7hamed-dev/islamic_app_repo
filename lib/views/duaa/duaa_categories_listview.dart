import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran/tools/push.dart';
import 'package:quran/widgets/custom_card.dart';
import 'package:quran/widgets/txt.dart';
import 'duaa_view.dart';
import 'duaa_controller.dart';

class DuaaCategoriesListView extends StatelessWidget {
  const DuaaCategoriesListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //
    return Consumer<DuaaController>(
      builder: (context, DuaaController value, Widget? child) {
        return ListView.builder(
          itemCount: value.searchDuaaModel.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                Push.to(
                  context,
                  DuaaView(
                    type: value.searchDuaaModel[index].type,
                    details: value.searchDuaaModel[index].details,
                  ),
                );
              },
              child: CardDuaaCategory(title: value.searchDuaaModel[index].type),
            );
          },
        );
      },
    );
  }
}

class CardDuaaCategory extends StatelessWidget {
  const CardDuaaCategory({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return CustomCard(
      margin: const EdgeInsets.all(6.0),
      padding: const EdgeInsets.all(10.0),
      child: Txt(
        title,
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
