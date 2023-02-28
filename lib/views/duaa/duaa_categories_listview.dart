import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran/animation/bottom_animation.dart';
import 'package:quran/tools/constants.dart';
import 'package:quran/tools/push.dart';
import 'card_category_duaa.dart';
import 'duaa_view.dart';
import 'duaa_controller.dart';

//

class DuaaCategoriesListView extends StatelessWidget {
  const DuaaCategoriesListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //
    return Consumer<DuaaController>(
      builder: (context, DuaaController value, _) {
        return GridView.builder(
          padding: const EdgeInsets.all(10.0),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2 / 1.5,
          ),
          itemCount: value.categories.length,
          physics: Constants.bouncScrollPhysics,
          itemBuilder: (BuildContext context, int index) {
            // return SizedBox();
            return BottomAnimator(
              time: Duration(milliseconds: 200 + index * 40),
              child: InkWell(
                onTap: () {
                  // value.selectedSingleCategory(index);
                  // print(value.category.title);
                  Push.to(
                    context,
                    DuaaView(
                      type: value.categories[index].type,
                      details: value.categories[index].details,
                    ),
                  );
                },
                child: CardDuaaCategory(
                  title: value.categories[index].type,
                  index: index,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
