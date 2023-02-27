import 'package:flutter/material.dart';
import 'package:quran/animation/bottom_animation.dart';
import 'package:quran/global/depency_injection.dart';

class GridViewColors extends StatelessWidget {
  const GridViewColors({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ///
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: DI.themeController(context).colors.length,
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
      ),
      itemBuilder: (BuildContext context, int index) {
        ///
        return BottomAnimator(
          time: Duration(milliseconds: index * 100 + 20),
          child: InkWell(
            onTap: () => DI.themeController(context).changeThemeColor(index),
            child: Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 3.0, vertical: 2.0),
              decoration: BoxDecoration(
                color: DI.themeController(context).colors[index],
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                border: Border.all(
                  width: DI
                              .themeController(context, isListen: true)
                              .selectedIndexOfColor ==
                          index
                      ? 2.0
                      : 0.0,
                ),
              ),
            ),
          ),
        );
      },
    );

    ///
  }
}
