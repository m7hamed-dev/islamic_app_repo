// import 'package:flutter/material.dart';
// import 'package:quran/views/duaa/card_duaa_zkr.dart';
// import 'package:quran/views/duaa/duaa_model.dart';
// import '../views/surah/all_surah_model.dart';
// import '../views/surah/card_surah.dart';

// class DuaaCategorySearchDelegate extends SearchDelegate<DuaaModel> {
//   //
//   DuaaCategorySearchDelegate({required this.list});
//   //
//   final List<Detail> list;
//   //
//   @override
//   List<Widget>? buildActions(BuildContext context) {
//     return [
//       IconButton(
//         onPressed: () => query = '',
//         icon: const Icon(Icons.close),
//       ),
//     ];
//   }

//   @override
//   Widget? buildLeading(BuildContext context) {
//     //
//     return IconButton(
//       onPressed: () => Navigator.pop(context),
//       icon: const Icon(Icons.arrow_back_ios),
//     );
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     List<DuaaModel> categories = [];
//     //
//     for (var item in list) {
//       if (item.contains(query)) {
//         categories.add(item);
//       }
//     }
//     return ListView.builder(
//       itemCount: list.length,
//       itemBuilder: (BuildContext context, int index) {
//         return CardDuaaZkr(
//           detail: categories[index].details,
//           pageController: PageController(),
//         );
//       },
//     );
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     //
//     List<SurahModel> suras = [];
//     //
//     for (var item in list) {
//       if (item.titleAr.contains(query)) {
//         suras.add(item);
//       }
//     }
//     return ListView.builder(
//       itemCount: suras.length,
//       itemBuilder: (BuildContext context, int index) {
//         return CardSurah(surahModel: suras[index], index: index);
//       },
//     );
//   }
// }
