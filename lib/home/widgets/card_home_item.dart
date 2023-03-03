import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran/home/widgets/custom_asset_img.dart';
import 'package:quran/styles/theme_controller.dart';
import 'package:quran/tools/push.dart';
import 'package:quran/widgets/custom_card.dart';
import 'package:quran/widgets/txt.dart';

class CardHomeItem extends StatelessWidget {
  //
  const CardHomeItem({
    Key? key,
    required this.title,
    required this.image,
    required this.page,
    this.isTransitonFromBottomToUp,
    this.color,
  }) : super(key: key);
  //
  final String title;
  final String image;
  final Widget page;
  final bool? isTransitonFromBottomToUp;
  final Color? color;
  //
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Push.to(context, page),
      child: CustomCard(
        color: color,
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: CustomAssetImg(path: 'assets/home/$image.png'),
            ),
            const SizedBox(height: 10),
            Consumer<ThemeController>(
              builder: (context, value, _) {
                return Expanded(
                  child: Txt(
                    title,
                    isUseFontSizePrefs: false,
                    fontSize: 11.0,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
