import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran/views/settings/settings_controller.dart';

class TxtTrans extends StatelessWidget {
  //
  const TxtTrans(
    this.data, {
    Key? key,
    this.color,
    required this.isUseFontSizePrefs,
    this.fontSize,
  }) : super(key: key);
  //
  final String data;
  final Color? color;
  final bool isUseFontSizePrefs;
  final double? fontSize;
  //
  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      // textDirection: TextDirection.rtl,
      softWrap: true,
      // textAlign: TextAlign.end,
      // overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: isUseFontSizePrefs
            ? context.watch<SettingsController>().fontSize
            : fontSize,
        fontFamily: context.watch<SettingsController>().fontType,
        color: color ?? Colors.black,
      ),
    ).tr();
  }
}
