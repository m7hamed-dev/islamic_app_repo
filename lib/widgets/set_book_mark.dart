import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran/storage/local_storage.dart';
import 'package:quran/tools/push.dart';
import 'package:quran/views/quran/quran_controller.dart';
import 'package:quran/views/quran/quran_view.dart';

class SetBookMark extends StatelessWidget {
  const SetBookMark({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        context.read<QuranController>().setCurrentPage(
              LocalStorage.getLastReadingQuranPage(),
            );
        //
        Push.to(context, const QuranView());
      },
      icon: const Icon(
        Icons.bookmark_border_rounded,
      ),
    );
  }
}
