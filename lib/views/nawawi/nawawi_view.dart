import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran/tools/constants.dart';
import 'package:quran/tools/push.dart';
import 'package:quran/views/nawawi/nawawi_model.dart';
import 'package:quran/views/nawawi/nawawi_provider.dart';
import 'package:quran/widgets/app_bar_title.dart';
import 'package:quran/widgets/btn.dart';
import 'package:quran/widgets/circular_icon.dart';
import 'package:quran/widgets/custom_card.dart';
import 'package:quran/widgets/custom_loading.dart';
import 'package:quran/widgets/icon_leading.dart';
import 'package:quran/widgets/icon_share.dart';
import 'package:quran/widgets/icon_show_bottomnavigation.dart';
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
                time: Duration(milliseconds: 50 + index * 2),
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
                      icon: const CircleIcon(icon: Icons.arrow_forward_ios),
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
      appBar: AppBar(
        title: AppBarTitle(nawawi.name),
        leading: const IconLeading(),
        actions: const [
          IconShowBottomNavigation(),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          CustomCard(child: Txt(nawawi.hadith)),
          CustomCard(
            child: Row(
              children: [
                IconShare(text: nawawi.hadith),
                Expanded(
                  child: Btn(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (context) {
                          return Scrollbar(
                            child: SafeArea(
                              child: ListView(
                                padding: const EdgeInsets.all(18.0),
                                children: [
                                  const SizedBox(height: 10.0),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: IconButton(
                                      icon: const CircleIcon(
                                        icon: Icons.close,
                                        colorIcon: Colors.red,
                                      ),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ),
                                  const SizedBox(height: 20.0),
                                  Txt(
                                    nawawi.description,
                                    // isUseFontSizePrefs: true,
                                  ),
                                ],
                              ),
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
