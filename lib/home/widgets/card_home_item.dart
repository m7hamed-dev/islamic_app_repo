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
        margin: const EdgeInsets.all(5.0),
        color: color,
        child: Stack(
          children: [
            Positioned(
              // bottom: 0.0,
              // right: 0,
              left: 5.0,
              top: 5.0,
              child: CustomAssetImg(
                path: 'assets/home/$image.png',
                width: 40.0,
                height: 40.0,
              ),
            ),
            Positioned(
              bottom: 8.0,
              left: 10.0,
              child: Consumer<ThemeController>(
                builder: (context, value, _) {
                  return Txt(
                    title,
                    isUseFontSizePrefs: false,
                    textStyle: maraiBold.copyWith(fontSize: 14.0),
                    color: Colors.white,
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
