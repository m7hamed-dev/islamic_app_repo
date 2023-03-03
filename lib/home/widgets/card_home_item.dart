import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran/home/widgets/custom_asset_img.dart';
import 'package:quran/styles/theme_controller.dart';
import 'package:quran/styles/txt_style.dart';
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
        margin: const EdgeInsets.all(10.0),
        color: color,
        child: Stack(
          children: [
            Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0,
              top: 0.0,
              child: CustomAssetImg(path: 'assets/home/$image.png'),
            ),
            Positioned(
              bottom: 5.0,
              left: 0.0,
              child: Consumer<ThemeController>(
                builder: (context, value, _) {
                  return Txt(
                    title,
                    isUseFontSizePrefs: false,
                    textStyle: maraiBlack.copyWith(fontSize: 20.0),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
