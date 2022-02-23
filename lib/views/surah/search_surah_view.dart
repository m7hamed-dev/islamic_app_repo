import 'package:flutter/material.dart';
import 'package:quran/views/surah/input_filtter.dart';
import 'package:quran/widgets/listview_surah.dart';

class SearchSurahView extends StatelessWidget {
  const SearchSurahView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: const [
          InputFiltter(),
          Expanded(child: ListViewSurah()),
        ],
      ),
    );
  }
}
