// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:quran/global/read_quran_online_pdf_provider.dart';
// import '../../views/quran/quran_online_view.dart';
// import '../../views/surah/all_surah_view.dart';
// import 'card_home_item.dart';

// class CardReadQuranOnlinePdf extends StatelessWidget {
//   const CardReadQuranOnlinePdf({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     //
//     return Consumer<ReadQuranOnlinePdfProvider>(
//       //
//       builder: (context, _provider, _) {
//         //
//         if (_provider.getReadOnline) {
//           return const CardHomeItem(
//             title: 'السور',
//             image: 'quran_ar',
//             page: AllSurahView(),
//             // isTransitonFromBottomToUp: true,
//           );
//         }
//         return const CardHomeItem(
//           title: 'السور - online',
//           image: 'quran_ar',
//           page: QuranOnlineView(),
//           // isTransitonFromBottomToUp: true,
//         );
//       },
//     );
//   }
//   //
// }
