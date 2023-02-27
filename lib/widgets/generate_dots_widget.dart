import 'package:flutter/material.dart';
import 'package:quran/global/depency_injection.dart';

class GenerateDotsWidget extends StatelessWidget {
  //
  const GenerateDotsWidget({
    Key? key,
    required this.items,
    required this.selectedIndex,
  }) : super(key: key);

  ///
  final List items;
  final int selectedIndex;

  ///
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 12.0,
      margin: const EdgeInsets.symmetric(
        vertical: 6.0,
        horizontal: 2.0,
      ),
      // padding: const EdgeInsets.all(4.0),
      // color: Colors.red.shade100,
      // color: Colors.transparent,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        // itemExtent: 20.0,
        children: List.generate(items.length, (index) {
          return AnimatedContainer(
            height: 10.0,
            width: 10.0,
            // width: selectedIndex == index ? 20.0 : 10.0,
            // padding: const EdgeInsets.all(20.0),
            margin: const EdgeInsets.all(2.0),
            curve: Curves.linear,
            // alignment: Alignment.center,
            duration: const Duration(milliseconds: 300),
            decoration: BoxDecoration(
              color: _dotsColor(context, index),
              //  selectedIndex == index
              //     ? Theme.of(context).primaryColor
              //     : Theme.of(context).primaryColor.withOpacity(.4),
              shape: BoxShape.circle,
            ),
          );
        }).toList(),
      ),
    );
  }

  Color _dotsColor(BuildContext context, int index) {
    //
    bool _isDarkTheme = DI.themeController(context).isDarkTheme;
    //
    if (_isDarkTheme) {
      if (selectedIndex == index) {
        return Colors.white;
      }
      return Colors.white.withOpacity(.5);
    }
    //
    if (selectedIndex == index) {
      return Theme.of(context).primaryColor;
    }
    //
    return Theme.of(context).primaryColor.withOpacity(.16);
  }
}
