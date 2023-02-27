// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:quran/global/depency_injection.dart';
// import 'package:quran/global/read_quran_online_pdf_provider.dart';
// import 'listtile_setting.dart';
// import 'txt.dart';

// class SwitchReadQuranOnlineOrPdf extends StatelessWidget {
//   const SwitchReadQuranOnlineOrPdf({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     debugPrint('SwitchReadQuranOnlineOrPdf.....');
//     return Consumer<ReadQuranOnlinePdfProvider>(
//       builder: (context, _controller, _) {
//         return ListTileSetting(
//           title: 'pdf قراءة القرآن في شكل ملف ',
//           subtitle: Txt(
//             // _controller.getReadOnline ? 'true' : 'false',
//             _controller.getReadOnline ? 'نعم' : 'لا',
//             isUseFontSizePrefs: false,
//             fontSize: 15.9,
//             fontFamily: 'pfd',
//             fontWeight: FontWeight.w100,
//           ),
//           // onTap: () =>
//           //     _controller.getCanVibrate ? _controller.runVibrate() : null,
//           icon: _controller.getReadOnline
//               ? Icons.picture_as_pdf
//               : Icons.text_fields_sharp,
//           trailing: CupertinoSwitch(
//             value: _controller.getReadOnline,
//             onChanged: _controller.onChanged,
//             activeColor: DI.primaryColor(context),
//             trackColor: DI.primaryColor(context).withOpacity(.4),
//           ),
//         );
//       },
//     );
//   }
// }
