import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran/styles/theme_controller.dart';

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
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        margin: margin ?? const EdgeInsets.all(5.0),
        padding: padding ?? const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          image: const DecorationImage(
            image: AssetImage('assets/icons/dashboard.png'),
            fit: BoxFit.fill,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(.2),
              spreadRadius: 7,
              blurRadius: 7,
              offset: const Offset(1.5, 3),
            ),
          ],
        ),
        child: Consumer<ThemeController>(
          builder: (context, theme, _) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: theme.primaryColor.withOpacity(.8),
                // color: RandomColor.getRandColor.withOpacity(.8),
                // color: Colors.pink.withOpacity(0.8),
              ),
              child: child,
            );
          },
        ),
      ),
    );
  }
}
//     return Container(
//       margin: margin ?? Constants.margin,
//       padding: padding ?? Constants.padding,
//       alignment: Alignment.center,
//       decoration: BoxDecoration(
//         color: RandomColor.getRandColor.withOpacity(.22),
//         boxShadow: const [
//           BoxShadow(
//             color: Colors.white,
//             // color: Colors.grey.withOpacity(.22),
//             spreadRadius: 10,
//             blurRadius: 10,
//             offset: Offset(1.5, 3),
//           ),
//         ],
//         image: const DecorationImage(
//           image: AssetImage('assets/icons/dashboard.png'),
//           fit: BoxFit.fill,
//         ),
//         borderRadius: BorderRadius.circular(15.0),
//       ),
//       // decoration: BoxDecoration(
//       //   borderRadius: const BorderRadius.all(Radius.circular(18.0)),
//       //   color: color ??
//       //       (DI.themeController(context, isListen: true).isDarkTheme
//       //           ? HexColor('#444d56')
//       //           : Colors.white),
//       //   boxShadow: [
//       //     BoxShadow(
//       //       color: Colors.black.withOpacity(.04),
//       //       spreadRadius: 10.0,
//       //       blurRadius: 10.0,
//       //     )
//       //   ],
//       // ),
//       child: child,
//       // child: MaterialButton(
//       //   // borderRadius: BorderRadius.circular(10.0),
//       //   // color: Colors.red,
//       //   shape: const RoundedRectangleBorder(
//       //     borderRadius: BorderRadius.all(Radius.circular(10.0)),
//       //   ),
//       //   onPressed: onTap,
//       //   splashColor: DI.primaryColor(context).withOpacity(.22),
//       //   child: child,
//       //   // child: InkWell(
//       //   //   onTap: onTap,
//       //   //   splashColor: DI.primaryColor(context).withOpacity(.2),
//       //   //   child: child,
//       //   // ),
//       // ),
//     );
//     //
//   }
// }
