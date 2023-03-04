import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran/tools/constants.dart';
import 'package:quran/tools/push.dart';
import 'package:quran/views/nawawi/nawawi_model.dart';
import 'package:quran/views/nawawi/nawawi_provider.dart';
import 'package:quran/widgets/app_bar_title.dart';
import 'package:quran/widgets/btn.dart';
import 'package:quran/widgets/custom_card.dart';
import 'package:quran/widgets/custom_loading.dart';
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
          if (provider.isLoading) {
            return const CustomLoading();
          }
          return ListView.builder(
            itemCount: provider.nawawis.length,
            physics: Constants.bouncScrollPhysics,
            itemBuilder: (BuildContext context, int index) {
              final nawawy = provider.nawawis[index];
              return BottomAnimator(
                time: Duration(milliseconds: 100 + index * 2),
                child: CustomCard(
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Txt(
                      '${index + 1}',
                      isUseFontSizePrefs: false,
                      fontSize: 20.0,
                    ),
                    title: Txt(
                      nawawy.name,
                      isUseFontSizePrefs: false,
                      fontSize: 18.0,
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.arrow_forward_ios),
                      onPressed: () {
                        Push.to(context, DescriptionWidget(nawawi: nawawy));
                      },
                    ),
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

class DescriptionWidget extends StatelessWidget {
  const DescriptionWidget({Key? key, required this.nawawi}) : super(key: key);
  final NawawiModel nawawi;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          CustomCard(child: Txt(nawawi.hadith)),
          Btn(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                // isScrollControlled: true,
                builder: (context) {
                  return Scrollbar(
                    child: ListView(
                      padding: const EdgeInsets.all(28.0),
                      children: [
                        IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        Txt(
                          nawawi.description,
                          isUseFontSizePrefs: true,
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            margin: const EdgeInsets.all(20.0),
            child: const Txt(
              'شرح الحديث',
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
