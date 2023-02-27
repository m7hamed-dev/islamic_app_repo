import 'package:flutter/material.dart';
import 'package:quran/tools/constants.dart';
import 'package:quran/tools/custom_message.dart';
import 'package:quran/widgets/txt.dart';

class Warning {
  static const bool _isSendSuccess = true;

  static void inCaseTxt(BuildContext context, String text) {
    //
    if (_isSendSuccess) {
      CustomMessage.showCustomSnackBar(
        context,
        // backgroundColor: Colors.green,
        content: const Txt(
          'تم رفع تنبيهك بنجاح شكرا لتعاونك سيتم المعالجه قريبا',
          isUseFontSizePrefs: false,
          color: Colors.white,
          fontSize: Constants.txtFontSize + 10,
          fontFamily: 'pfd',
        ),
      );
    }
  }
}
