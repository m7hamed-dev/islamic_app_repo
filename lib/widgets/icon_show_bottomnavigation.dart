import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran/styles/row_select_color.dart';
import 'package:quran/tools/constants.dart';
import 'package:quran/tools/screen_util.dart';
import 'package:quran/widgets/circular_icon.dart';
import 'package:quran/widgets/slider_change_size_font.dart';

import '../views/settings/settings_controller.dart';

class IconShowBottomNavigation extends StatelessWidget {
  const IconShowBottomNavigation({Key? key}) : super(key: key);
  //
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: Consumer<SettingsController>(
              builder: (context, settings, _) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 400),
                  padding: const EdgeInsets.all(10.0),
                  margin: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withOpacity(.22),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                  ),
                  child: ListView(
                    shrinkWrap: true,
                    physics: Constants.bouncScrollPhysics,
                    padding: const EdgeInsets.all(10.0),
                    children: [
                      InkWell(
                        child: Container(
                          height: 12.0,
                          width: ScreenUtil.getWidth(context) / 3,
                          alignment: Alignment.center,
                          margin: const EdgeInsets.symmetric(vertical: 9.0),
                          decoration: BoxDecoration(
                            color:
                                Theme.of(context).primaryColor.withOpacity(.2),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Container(
                            height: 4.0,
                            width: ScreenUtil.getWidth(context) / 4,
                            // margin: const EdgeInsets.symmetric(vertical: 9.0),
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(20.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      const SliderChangeSizeFont(),
                      const SizedBox(height: 10.0),
                      const RowSelectColor()
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
      borderRadius: BorderRadius.circular(20.0),
      child: const CircleIcon(icon: Icons.more_vert_rounded),
    );
  }
}
