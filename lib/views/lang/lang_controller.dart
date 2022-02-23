import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LangController extends ChangeNotifier {
  //
  String getCurrentCountryCode(BuildContext context) {
    String _value =
        EasyLocalization.of(context)!.currentLocale!.countryCode ?? 'ar';
    debugPrint('_value = $_value');
    return EasyLocalization.of(context)!.currentLocale!.countryCode ?? 'ar';
  }
  //
}
