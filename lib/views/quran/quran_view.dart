import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran/tools/custom_message.dart';
import 'package:quran/views/quran/quran_controller.dart';
import 'package:quran/widgets/app_bar_title.dart';
import 'package:quran/widgets/txt.dart';

class QuranView extends StatefulWidget {
  const QuranView({Key? key, required this.surahName}) : super(key: key);
  static const pageName = '/quran_view';
  //
  final String surahName;
  @override
  State<QuranView> createState() => _QuranViewState();
}

class _QuranViewState extends State<QuranView> {
  ///
  late QuranController _quranController;
  //
  @override
  void initState() {
    _quranController = context.read<QuranController>();
    super.initState();
  }

  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppBarTitle(widget.surahName),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.bookmark_add_sharp,
              // color: Colors.red,
              size: 30.0,
            ),
            onPressed: () {
              _quranController.saveBookMark(
                  _quranController.currentPage, widget.surahName);
              CustomMessage.showCustomSnackBar(
                context,
                content: const Txt(
                  'تم حفظ الصفحه',
                  isUseFontSizePrefs: false,
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              );
            },
          ),
          // IconButton(
          //   icon: const Icon(
          //     Icons.share,
          //     // color: Colors.red,
          //     size: 30.0,
          //   ),
          //   onPressed: () {
          //     Push.to(
          //       context,
          //       TakeScreenShotFromWidget(
          //         child: _quranController.pdf(),
          //       ),
          //     );
          //   },
          // ),
        ],
      ),
      body: _quranController.pdf(),
    );
  }
}
