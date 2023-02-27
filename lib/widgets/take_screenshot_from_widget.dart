import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quran/widgets/app_bar_title.dart';
import 'package:quran/widgets/icon_leading.dart';
import 'package:quran/widgets/icon_show_bottomnavigation.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';
import '../global/custom_app_bar_shape.dart';

//
class TakeScreenShotFromWidget extends StatefulWidget {
  //
  const TakeScreenShotFromWidget({
    Key? key,
    required this.child,
  }) : super(key: key);
  //
  final Widget child;

  @override
  State<TakeScreenShotFromWidget> createState() =>
      _TakeScreenShotFromWidgetState();
}

class _TakeScreenShotFromWidgetState extends State<TakeScreenShotFromWidget> {
  //
  final _previewContainer = GlobalKey();
  ScreenshotController screenshotController = ScreenshotController();

  Future<void> _takeScreenShot() async {
    // ShareFilesAndScreenshotWidgets().shareScreenshot(
    //   _previewContainer,
    //   1000,
    //   "Title",
    //   "Name.png",
    //   "image/png",
    //   text: 'test/take_screenshot_from_widget',
    // );
    screenshotController
        .captureFromWidget(
      Container(
        padding: const EdgeInsets.all(30.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blueAccent, width: 5.0),
          color: Colors.redAccent,
        ),
        child: widget.child,
      ),
    )
        .then((capturedImage) async {
      // Uint8List pngBytes = byteData.buffer.asUint8List();
      final _data = await loadImage(capturedImage);
      // await Share

      await Share.shareFiles(['${_data.path}/image.png'],
          text: 'Great picture');

      // debugPrint('capturedImage $capturedImage');
      // CustomShare.shareMp3(
      //   key: capturedImage.,
      //   title: 'title',
      //   text: 'text',
      // );
      // Handle captured image
    });
  }

  Future<File> loadImage(Uint8List img) async {
    final directory = await getApplicationDocumentsDirectory();
    final pathOfImage = await File('${directory.path}/legendary.png').create();
    final bytes = img.buffer.asUint8List();
    return await pathOfImage.writeAsBytes(bytes);
  }

  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarTitle('مشاركة الصورة'),
        leading: const IconLeading(),
        actions: [
          IconButton(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            onPressed: _takeScreenShot,
            icon: const Icon(Icons.ios_share),
          ),
          const IconShowBottomNavigation()
        ],
        shape: CustomAppBarShape(),
      ),
      body: widget.child,
      // bottomNavigationBar: const NavigationBbottomSettings(),
    );
  }
}
