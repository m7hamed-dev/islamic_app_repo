import 'dart:typed_data';
import 'package:flutter/services.dart';
// import 'package:share/share.dart';
import 'package:share_files_and_screenshot_widgets/share_files_and_screenshot_widgets.dart';

class CustomShare {
  static void shareTxt(String text, {String? subject, String? mimeType}) {
    // Share.share(
    //   text,
    //   subject: subject,
    // );
  }

  static void shareMp3({
    required String key,
    required String title,
    required String text,
  }) async {
    ByteData bytes = await rootBundle.load(key);
    Uint8List list = bytes.buffer.asUint8List();
    //
    ShareFilesAndScreenshotWidgets().shareFile(
      title,
      "Name.mp3",
      list,
      "image/png",
      // "audio/mp3",
      text: text,
    );
  }
}
