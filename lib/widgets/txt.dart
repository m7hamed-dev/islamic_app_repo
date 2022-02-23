import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran/views/settings/settings_controller.dart';

class Txt extends StatelessWidget {
  const Txt(
    this.data, {
    Key? key,
    this.color,
    this.isUseFontSizePrefs = true,
    this.fontSize,
    this.textAlign,
    this.fontWeight,
  }) : super(key: key);
  //
  final String data;
  final Color? color;
  final bool? isUseFontSizePrefs;
  final double? fontSize;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;
  //
  @override
  Widget build(BuildContext context) {
    //
    return Text(
      data,
      // softWrap: true,
      // textAlign: textAlign ?? TextAlign.center,
      style: TextStyle(
        fontSize: isUseFontSizePrefs == false
            ? fontSize
            : context.watch<SettingsController>().fontSize,
        fontFamily: context.watch<SettingsController>().fontType,
        color: color ?? Theme.of(context).primaryColor,
        fontWeight: fontWeight,
      ),
    );
  }
}
