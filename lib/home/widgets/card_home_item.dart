import 'package:flutter/material.dart';
import 'package:quran/animation/transition_animation.dart';
import 'package:quran/tools/push.dart';
import '../../widgets/txt_trans.dart';

class CardHomeItem extends StatelessWidget {
  //
  const CardHomeItem({
    Key? key,
    required this.title,
    required this.image,
    required this.page,
    this.isShowIcon,
    this.icon,
    this.isTransitonFromBottomToUp,
  }) : super(key: key);
  //
  final String title;
  final String image;
  final Widget page;
  final bool? isShowIcon;
  final IconData? icon;
  final bool? isTransitonFromBottomToUp;
  //
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => isTransitonFromBottomToUp == true
          ? transitionAnimation.fromBottomToTop(
              context: context, goToPage: page)
          : Push.to(context, page),
      child: Container(
        margin: const EdgeInsets.all(4.0),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).primaryColor.withOpacity(.20),
              blurRadius: 10.0,
              spreadRadius: 2.0,
            )
          ],
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            isShowIcon == true ? _icon() : _img(),
            TxtTrans(
              title,
              isUseFontSizePrefs: false,
              fontSize: 18.0,
            ),
          ],
        ),
      ),
    );
  }

  Image _img() => Image.asset(
        'assets/$image',
        width: 60.0,
        height: 60.0,
      );

  Icon _icon() => Icon(
        icon,
        size: 60.0,
        color: Colors.red[900],
      );
}
