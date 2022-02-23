import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quran/tools/custom_message.dart';
import 'package:quran/widgets/txt.dart';

class Copy {
  static void toClipBoard(BuildContext context, String text) {
    Clipboard.setData(ClipboardData(text: text)).then((value) {
      CustomMessage.showCustomSnackBar(
        context,
        backgroundColor: Colors.green,
        content: const Txt(
          'copied succss !!',
          isUseFontSizePrefs: false,
          color: Colors.white,
        ),
      );
    });
  }
}
