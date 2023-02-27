// import 'package:flutter/material.dart';
// import 'package:quran/views/achievements/data_source.dart';
// import 'package:quran/widgets/app_bar_title.dart';
// import 'package:quran/widgets/custom_card.dart';
// import '../../global/custom_app_bar_shape.dart';
// import '../../global/depency_injection.dart';
// import '../../widgets/txt.dart';

// //
// class AdvaiceForRamadanView extends StatelessWidget {
//   const AdvaiceForRamadanView({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const AppBarTitle('adv'),
//         shape: CustomAppBarShape(),
//       ),
//       body: ListView.builder(
//         itemCount: DataTableSource.advaiceRamadan.length,
//         itemBuilder: (_, int index) {
//           return CustomCard(
//             child: Column(
//               children: const [
//                 // Txt(
//                 //   DataSource.advaiceRamadan[index],
//                 //   isUseFontSizePrefs: false,
//                 //   fontSize: 15.0,
//                 //   textAlign: TextAlign.center,
//                 //   fontFamily: 'DroidKufi',
//                 //   color: DI.themeController(context).isDarkTheme
//                 //       ? Colors.white
//                 //       : Colors.black,
//                 // ),
//                 // RowMultiProcess(
//                 //   text: DataSource.advaiceRamadan[index],
//                 //   title: 'نصائح رمضانيه',
//                 //   hsna: '',
//                 //   titleFavourit: '',
//                 // )
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
