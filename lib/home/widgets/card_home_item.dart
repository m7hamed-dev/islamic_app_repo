import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran/animation/slide_right_page_trans.dart';
import 'package:quran/home/widgets/custom_asset_img.dart';
import 'package:quran/styles/custom_box_decoration.dart';
import 'package:quran/styles/theme_controller.dart';
import 'package:quran/widgets/txt.dart';

class CardHomeItem extends StatelessWidget {
  //
  const CardHomeItem({
    Key? key,
    required this.title,
    required this.image,
    required this.page,
    this.isTransitonFromBottomToUp,
  }) : super(key: key);
  //
  final String title;
  final String image;
  final Widget page;
  final bool? isTransitonFromBottomToUp;
  //
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // isTransitonFromBottomToUp == true
        //     ? transitionAnimation.fromBottomToTop(
        //         context: context,
        //         goToPage: page,
        //       )
        //     : Push.to(context, page);

        Navigator.push(
          context,
          SlideRightRoute(page: page),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 5.0,
          horizontal: 5.0,
        ),
        decoration: CustomBoxDecoraton.decoration(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomAssetImg(path: 'assets/home/$image.png'),
            Consumer<ThemeController>(
              builder: (context, value, _) {
                return Txt(
                  title,
                  isUseFontSizePrefs: false,
                  fontSize: 13.0,
                  // color: value.isDarkTheme
                  //     ? HexColor('#ffffff')
                  //     : Theme.of(context).primaryColor,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
