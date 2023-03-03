import 'dart:math';

import 'package:flutter/material.dart';
import 'package:quran/global/depency_injection.dart';
import 'package:quran/tools/constants.dart';

class RandomColor {
  // This holds the items of the ListView
  // static final _listItems = List.generate(200, (i) => "Item $i");

  static final _random = Random();

  static Color get getRandColor {
    return Colors.primaries[_random.nextInt(Colors.primaries.length)]
            [_random.nextInt(9) * 100] ??
        Colors.pink.withOpacity(.5);
  }
}

class CustomCard extends StatelessWidget {
  //
  const CustomCard({
    Key? key,
    required this.child,
    this.margin,
    this.padding,
    this.width,
    this.height,
    this.onTap,
    this.color,
  }) : super(key: key);
  //
  final Widget child;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final double? width;
  final double? height;
  final Color? color;
  final void Function()? onTap;
  //
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? Constants.margin,
      padding: padding ?? Constants.padding,
      decoration: BoxDecoration(
        color: RandomColor.getRandColor.withOpacity(.11),
        // color: color ?? Colors.pink.withOpacity(.05),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(1.5, 3),
          ),
        ],
        image: const DecorationImage(
          image: AssetImage('assets/icons/dashboard.png'),
          fit: BoxFit.fill,
        ),
        borderRadius: BorderRadius.circular(25),
      ),
      // decoration: BoxDecoration(
      //   borderRadius: const BorderRadius.all(Radius.circular(18.0)),
      //   color: DI.themeController(context, isListen: true).isDarkTheme
      //       ? HexColor('#444d56')
      //       : Colors.white,
      //   boxShadow: [
      //     BoxShadow(
      //       color: Colors.black.withOpacity(.04),
      //       spreadRadius: 10.0,
      //       blurRadius: 10.0,
      //     )
      //   ],
      // ),
      // alignment: Alignment.center,
      child: MaterialButton(
        // borderRadius: BorderRadius.circular(10.0),
        // color: Colors.red,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        onPressed: onTap,
        splashColor: DI.primaryColor(context).withOpacity(.22),
        child: child,
        // child: InkWell(
        //   onTap: onTap,
        //   splashColor: DI.primaryColor(context).withOpacity(.2),
        //   child: child,
        // ),
      ),
    );
    //
  }
}
