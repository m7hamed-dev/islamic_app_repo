import 'package:flutter/material.dart';
import 'package:quran/tools/push.dart';
import 'package:quran/views/surah/search_surah_view.dart';

class SearchIcon extends StatelessWidget {
  const SearchIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => InkWell(
      onTap: () => Push.withPage(context, const SearchSurahView()),
      child: const Icon(Icons.search));
}
