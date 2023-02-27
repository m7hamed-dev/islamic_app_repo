// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:quran/views/settings/settings_controller.dart';
// import 'package:quran/widgets/txt.dart';
//
// class RowFontsSize extends StatelessWidget {
//   const RowFontsSize({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     debugPrint('RowFontsSize.....');
//     return Consumer<SettingsController>(
//       builder: (context, _controller, _) {
//         return Row(
//           children: List.generate(_controller.fontsSize.length, (index) {
//             return Expanded(
//               child: InkWell(
//                 onTap: () {
//                   _controller.onSeletedFontSize(context, index);
//                 },
//                 child: Container(
//                   height: 50,
//                   margin: const EdgeInsets.symmetric(horizontal: 2.0),
//                   alignment: Alignment.center,
//                   decoration: BoxDecoration(
//                     color: _controller.getIndexOfFontTypeFromPrefs == index
//                         ? Colors.black
//                         : Theme.of(context).primaryColor.withOpacity(.50),
//                     borderRadius: BorderRadius.circular(10.0),
//                   ),
//                   child: Txt(
//                     _controller.fontsSize[index],
//                     isUseFontSizePrefs: false,
//                     fontSize: 20.0,
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             );
//           }).toList(),
//         );
//       },
//     );
//   }
// }
