import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran/styles/theme_controller.dart';
import 'package:quran/styles/txt_style.dart';
import 'package:quran/views/settings/settings_controller.dart';

class Txt extends StatelessWidget {
  //
  const Txt(
    this.data, {
    Key? key,
    this.color,
    this.isUseFontSizePrefs = true,
    this.fontSize,
    this.textAlign,
    this.textStyle,
  }) : super(key: key);
  //
  final String data;
  final Color? color;
  final bool? isUseFontSizePrefs;
  final double? fontSize;
  final TextAlign? textAlign;
  final TextStyle? textStyle;
  //
  @override
  Widget build(BuildContext context) {
    //
    return Consumer<SettingsController>(
      builder: (context, controller, _) {
        return Text(
          data,
          // ' ' + data + ' ',
          // softWrap: true,
          // maxLines: 10,
          // overflow: TextOverflow.fade,
          textAlign: textAlign,
          style: textStyle ??
              maraiBold.copyWith(
                fontSize: isUseFontSizePrefs == false
                    ? fontSize
                    : controller.fontSize,
                color:
                    context.watch<ThemeController>().txtColor(context, color),
              ),
          // style: TextStyle(
          //   fontSize:
          //       isUseFontSizePrefs == false ? fontSize : controller.fontSize,
          //   // fontFamily: 'tajawal',
          //   fontFamily: 'dinn-reg',
          //   // fontFamily: fontFamily ?? _controller.fontType,
          //   color: context.watch<ThemeController>().txtColor(context, color),
          //   fontWeight: fontWeight,
          // ),
        );
      },
    );
  }
}
