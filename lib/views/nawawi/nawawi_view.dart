import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran/tools/constants.dart';
import 'package:quran/views/nawawi/nawawi_provider.dart';
import 'package:quran/widgets/app_bar_title.dart';
import 'package:quran/widgets/custom_card.dart';
import 'package:quran/widgets/icon_leading.dart';
import 'package:quran/widgets/txt.dart';
import '../../animation/bottom_animation.dart';

class NawawisView extends StatelessWidget {
  const NawawisView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarTitle('أسماء الله الحسني'),
        leading: const IconLeading(),
      ),
      body: Consumer<NawawiProvider>(
        builder: (context, provider, _) {
          return ListView.builder(
            itemCount: provider.nawawis.length,
            physics: Constants.bouncScrollPhysics,
            itemBuilder: (BuildContext context, int index) {
              final nawawy = provider.nawawis[index];
              return BottomAnimator(
                time: Duration(milliseconds: 300 + index * 3),
                child: CustomCard(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Txt(
                        nawawy.hadith,
                        isUseFontSizePrefs: false,
                        fontSize: 26.0,
                      ),
                      const SizedBox(height: 10.0),
                      Txt(
                        nawawy.description,
                        // isUseFontSizePrefs: false,
                        // fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
