import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quran/tools/constants.dart';
import 'package:quran/tools/custom_message.dart';
import 'package:quran/widgets/txt.dart';

class Copy {
  static void toClipBoard(BuildContext context, String text) {
    //
    Clipboard.setData(ClipboardData(text: text)).then((value) {
      CustomMessage.showCustomSnackBar(
        context,
        // backgroundColor: Colors.green,
        content: const Txt(
          'تم النسخ بنجاح',
          isUseFontSizePrefs: false,
          color: Colors.white,
          fontSize: Constants.txtFontSize + 10,
          fontFamily: 'pfd',
        ),
      );
    });
  }
}
