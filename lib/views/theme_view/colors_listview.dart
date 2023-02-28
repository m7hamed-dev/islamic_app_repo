import 'package:flutter/material.dart';
import 'package:quran/animation/bottom_animation.dart';
import 'package:quran/global/depency_injection.dart';
import 'package:quran/widgets/btn.dart';
import 'package:quran/widgets/txt.dart';

class GridViewColors extends StatelessWidget {
  const GridViewColors({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ///
    return Padding(
      padding: const EdgeInsets.all(22.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Txt('اختر لون لكامل التطبيق'),
          const Divider(),
          GridView.builder(
            padding: const EdgeInsets.all(10.0),
            itemCount: DI.themeController(context).colors.length,
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
            ),
            itemBuilder: (BuildContext context, int index) {
              ///
              return BottomAnimator(
                time: Duration(milliseconds: index * 60 + 20),
                child: InkWell(
                  onTap: () =>
                      DI.themeController(context).changeThemeColor(index),
                  child: Container(
                    margin: const EdgeInsets.all(5.0),
                    padding: const EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                      color: DI.themeController(context).colors[index],
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      border: DI
                                  .themeController(context, isListen: true)
                                  .selectedIndexOfColor ==
                              index
                          ? Border.all(
                              color: DI.themeController(context).colors[index],
                              width: 9.0,
                            )
                          : null,
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 10.0,
                          blurRadius: 10.0,
                          color: DI
                              .themeController(context)
                              .colors[index]
                              .withOpacity(.14),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          const Divider(),
          Btn(
            onPressed: () => Navigator.pop(context),
            child: const Txt('اغلاق', color: Colors.white),
          )
        ],
      ),
    );

    ///
  }
}
