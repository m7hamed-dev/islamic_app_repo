import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:quran/tools/custom_message.dart';
import 'package:quran/tools/custom_share.dart';
import 'package:quran/views/quran/quran_controller.dart';
import 'package:quran/widgets/txt.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_files_and_screenshot_widgets/share_files_and_screenshot_widgets.dart';
import 'package:share_plus/share_plus.dart';

class QuranView extends StatefulWidget {
  const QuranView({Key? key}) : super(key: key);
  static const pageName = '/quran_view';
  //
  @override
  State<QuranView> createState() => _QuranViewState();
}

class _QuranViewState extends State<QuranView> {
  final int originalSize = 800;
  final GlobalKey _previewContainerKey = GlobalKey();
  //
  final _screenshotController = ScreenshotController();

  Future<void> _takeScreenshot() async {
    await ShareFilesAndScreenshotWidgets()
        .takeScreenshot(previewContainer, originalSize)
        .then((value) {
      debugPrint('value $value');
      if (value != null) {
        debugPrint('value $value');
        CustomShare.shareMp3(
            key: value.key.toString(), title: 'title', text: 'text');
        // ShareFilesAndScreenshotWidgets().shareScreenshot(
        //   previewContainer,
        //   originalSize,
        //   "Title",
        //   "Name.png",
        //   "image/png",
        //   text: "This is the caption!",
        // );
      }
      // setState(() {
      //   _image = value!;
      // });
    });
  }

  late Image _image;

  GlobalKey previewContainer = new GlobalKey();

  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(
              Icons.bookmark_add_sharp,
              color: Colors.red,
              size: 30.0,
            ),
            onPressed: () {
              final _controller = context.read<QuranController>();
              _controller.saveBookMark(_controller.currentPage);
              CustomMessage.showCustomSnackBar(context,
                  content: const Txt('add to book mark'));
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.screenshot_rounded,
              color: Colors.black,
              size: 30.0,
            ),
            onPressed: () async {
              final imageFile = await _screenshotController.captureFromWidget(
                  // context.read<QuranController>().pdf2(),
                  // Icon(
                  //   Icons.abc_outlined,
                  //   size: 300,
                  //   color: Colors.pink,
                  // ),
                  Screenshot(
                controller: _screenshotController,
                child: Container(
                  width: 200,
                  height: 200,
                  color: Colors.blue,
                  child: const Icon(
                    Icons.abc_outlined,
                    size: 300,
                    color: Colors.pink,
                  ),

                  // child: context.read<QuranController>().pdf2(),
                ),
              ));
              //
              final directory = await getApplicationDocumentsDirectory();
              final imagePath = File('${directory.path}/image.png');
              final Uint8List pngBytes = imageFile.buffer.asUint8List();
              await imagePath.writeAsBytes(pngBytes);
              // getPdf(pngBytes, imagePath.path);
              await Share.shareFiles(
                [imagePath.path],
              );
            },
          ),
          Container(
            height: 10.0,
            color: Colors.grey.shade200,
          ),
        ],
      ),
      body: context.watch<QuranController>().pdf(),
    );
  }

  // Widget _contentSnackBar(BuildContext context) {
  //   return SizedBox(
  //     height: ScreenUtil.getHeight(context) / 3,
  //     child: Column(
  //       children: [
  //         Btn(
  //           child: Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //             children: const [Text('share'), Icon(Icons.share)],
  //           ),
  //           onPressed: () async {
  //             // Optionally the request above
  //             // ShareFilesAndScreenshotWidgets().shareScreenshot(
  //             //   _previewContainerKey,
  //             //   originalSize,
  //             //   "mohamed test",
  //             //   "Name.png",
  //             //   "image/png",
  //             //   text: "This is the caption!",
  //             // );
  //           },
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // Widget _buildImage() {
  //   // return Container(
  //   //   color: Colors.pink,
  //   //   height: 900,
  //   // );
  //   // return QuranController().pdf2();
  //   return context.read<QuranController>().pdf2();
  // }

  // Txt _translation(data) {
  //   return Txt(data.toString());
  // }
}
