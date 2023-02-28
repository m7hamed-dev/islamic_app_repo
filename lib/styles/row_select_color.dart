import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran/styles/custom_box_decoration.dart';
import 'package:quran/styles/theme_controller.dart';
import 'package:quran/views/theme_view/colors_listview.dart';
import 'package:quran/widgets/btn.dart';
import 'package:quran/widgets/txt.dart';

import '../tools/constants.dart';

class RowSelectColor extends StatelessWidget {
  //
  const RowSelectColor({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeController>(
      builder: (context, controller, _) {
        return Container(
          decoration: CustomBoxDecoraton.decoration(context),
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Txt(
                'مظهر التطبيق',
                isUseFontSizePrefs: false,
                fontSize: Constants.fontSizeForSettingsTxt,
              ),
              // const Divider(),
              //
              const SizedBox(height: 10.0),
              SizedBox(
                height: 50.0,
                child: Row(
                  children: [
                    //
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          controller.changeThemeColor(1);
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 400),
                          decoration: BoxDecoration(
                            color:
                                Theme.of(context).primaryColor.withOpacity(.9),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          alignment: Alignment.center,
                          child: controller.isLightTheme
                              ? Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: const [
                                    Icon(
                                      Icons.done,
                                      color: Colors.white,
                                    ),
                                    Txt(
                                      'مضئ',
                                      isUseFontSizePrefs: false,
                                      fontSize: 20.0,
                                      color: Colors.white,
                                    ),
                                  ],
                                )
                              : const Txt(
                                  'مضئ',
                                  isUseFontSizePrefs: false,
                                  fontSize: 20.0,
                                  color: Colors.white,
                                ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 15.0),
                    //
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          controller.changeThemeColor(100);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(.9),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          alignment: Alignment.center,
                          child: controller.isLightTheme == false
                              ? Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Icon(
                                      Icons.done,
                                      color: Colors.white,
                                    ),
                                    Txt(
                                      'غاتم',
                                      isUseFontSizePrefs: false,
                                      fontSize: 20.0,
                                      color:
                                          controller.selectedIndexOfColor == 100
                                              ? Colors.white
                                              : Colors.black,
                                    ),
                                  ],
                                )
                              : Txt(
                                  'غاتم',
                                  isUseFontSizePrefs: false,
                                  fontSize: 20.0,
                                  color: controller.selectedIndexOfColor != 100
                                      ? Colors.white
                                      : Colors.black,
                                ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10.0),
              // if index of colors  equal 100 then hide colors
              controller.isLightTheme == false
                  ? const SizedBox()
                  : Btn(
                      onPressed: () async {
                        await showDialog(
                          context: context,
                          builder: (context) {
                            return const Dialog(child: GridViewColors());
                          },
                        );
                      },
                      child: const Txt(
                        'اختر لون التطبيق ',
                        isUseFontSizePrefs: false,
                        fontSize: 17.0,
                        color: Colors.white,
                      ),
                    ),
            ],
          ),
        );
      },
    );
  }
}
