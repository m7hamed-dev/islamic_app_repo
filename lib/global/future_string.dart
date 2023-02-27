import 'package:flutter/services.dart' show rootBundle;

class FutureString {
  static Future<String> from(String key) async =>
      await Future.delayed(const Duration(milliseconds: 1000)).then((_) {
        return Future.value(rootBundle.loadString(key));
      });
}
