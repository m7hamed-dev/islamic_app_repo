// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:quran/styles/custom_box_decoration.dart';
// import 'package:quran/views/settings/settings_controller.dart';
// import '../storage/local_storage.dart';
// import '../tools/constants.dart';
// import 'txt.dart';

// class RowFontTypes extends StatefulWidget {
//   //
//   const RowFontTypes({
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<RowFontTypes> createState() => _RowFontTypesState();
// }

// class _RowFontTypesState extends State<RowFontTypes> {
//   //
//   int _selectedIndex = 0;

//   @override
//   void initState() {
//     if (!mounted) {
//       return;
//     }
//     _selectedIndex = LocalStorage.getIndexFontType;
//     setState(() {});
//     //
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     debugPrint('RowFontTypes rebuild ..');
//     return Consumer<SettingsController>(
//       builder: (context, controller, _) {
//         int num = controller.getIndexOfFontTypeFromPrefs;
//         debugPrint('num = $num');
//         return Container(
//           height: 100.0,
//           width: double.infinity,
//           padding: const EdgeInsets.all(10.0),
//           // margin: EdgeInsets.only(bottom: 5.0),
//           decoration: CustomBoxDecoraton.decoration(context),
//           // decoration: BoxDecoration(
//           //   // borderRadius: BorderRadius.circular(10.0),
//           //   color: Theme.of(context).primaryColor.withOpacity(.15),
//           // ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Txt(
//                 'نوع خط التطبيق',
//                 isUseFontSizePrefs: false,
//                 fontSize: Constants.fontSizeForSettingsTxt,
//                 fontFamily: 'pfd',
//               ),
//               const SizedBox(height: 5.0),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 // crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: List.generate(controller.fontsName.length, (index) {
//                   //
//                   return InkWell(
//                     onTap: () {
//                       // debugPrint('inkwell index = $index');
//                       controller.onSelectedFontType(index);
//                       _selectedIndex = index;
//                       setState(() {});
//                     },
//                     child: AnimatedContainer(
//                       duration: const Duration(milliseconds: 300),
//                       curve: Curves.linear,
//                       width: 80.0,
//                       height: 40.0,
//                       // margin: const EdgeInsets.symmetric(horizontal: 2.0),
//                       alignment: Alignment.center,
//                       decoration: BoxDecoration(
//                         // color: Theme.of(context).primaryColor.withOpacity(.50),
//                         borderRadius: BorderRadius.circular(10.0),
//                         border: Border.all(
//                           width: _selectedIndex == index
//                               // width: _controller.selectedFontTypeIndex == index
//                               ? 3.0
//                               : 0.0,
//                         ),
//                       ),
//                       child: Txt(
//                         controller.fontsName[index],
//                         isUseFontSizePrefs: false,
//                         fontSize: 13.0,
//                         // fontSize: Constants.fontSizeForSettingsTxt,
//                         fontFamily: 'DroidKufi',
//                         textAlign: TextAlign.center,
//                         // ),
//                       ),
//                     ),
//                   );
//                 }).toList(),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
