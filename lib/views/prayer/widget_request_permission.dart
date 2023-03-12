// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:quran/views/prayer/location_serivce.dart';
// import 'package:quran/widgets/btn.dart';
// import '../../widgets/txt.dart';

// class WidgetRequestPermission extends StatelessWidget {
//   const WidgetRequestPermission({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           const Icon(Icons.location_off),
//           const Txt(
//             'تاكد من فتح الموقع وتوفر الانترنت لديك',
//             isUseFontSizePrefs: false,
//             fontSize: 20.0,
//           ),
//           const Txt(
//             'لكي تتمكن من معرفة توقيت البلد المتواجد فيه امنحنا فقط صلاحية الوصول لموقعك',
//             isUseFontSizePrefs: false,
//             fontSize: 14.0,
//             color: Colors.grey,
//           ),
//           Consumer<LocationServiceProvider>(
//             builder: (context, service, _) => Btn(
//               onPressed: () {
//                 // if service location is enable
//                 if (service.serviceEnabled) {
//                   // _service.requestPermission();
//                 } else {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(
//                       content: const Txt(
//                         'لكي تتمكن من معرفة توقيت البلد المتواجد فيه امنحنا فقط صلاحية الوصول لموقعك',
//                         isUseFontSizePrefs: false,
//                         fontSize: 20.0,
//                         color: Colors.white,
//                       ),
//                       backgroundColor: Theme.of(context).primaryColor,
//                     ),
//                   );
//                 }
//               },
//               child: const Txt(
//                 'طلب الصلاحية',
//                 isUseFontSizePrefs: false,
//                 fontSize: 20.0,
//                 color: Colors.white,
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
