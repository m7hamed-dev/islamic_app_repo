// import 'package:flutter/material.dart';
// import 'package:quran/tools/push.dart';
// import '../constant/surah_builder.dart';
// import '../widgets/custom_twe_container.dart';
// import '../widgets/customcontainer.dart';
// import 'constant.dart';
// import 'index.dart';
// import 'qiblah.dart';

// class HomePage extends StatelessWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: backgroundColor,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0.0,
//         centerTitle: true,
//         title: Text(
//           "myQuran",
//           style: titleGreenStyle(),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               CustomContainer(
//                 height1: 200,
//                 image: 'assets/icons/quran.png',
//                 title: "Quran",
//                 color: greenColor,
//                 onpressed: () {},
//               ),
//               CustomTwoContainer(
//                 height1: 220,
//                 image: 'assets/icons/bookmark.png',
//                 title: "Bookmars",
//                 color: purpleColor,
//                 onpressed: () {},
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class GotoWidget extends StatelessWidget {
//   final VoidCallback? onpressed;
//   const GotoWidget({Key? key, this.onpressed}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         Push.to(context, const IndexPage());
//       },
//       child: const Icon(
//         Icons.arrow_forward_ios,
//         color: Colors.white,
//         size: 13,
//       ),
//     );
//   }
// }

// class GotoTwoWidget extends StatelessWidget {
//   final VoidCallback? onpressed;
//   const GotoTwoWidget({Key? key, this.onpressed}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         InkWell(
//             onTap: () {
//               Push.to(
//                 context,
//                 SurahBuilder(
//                   fabIsClicked: false,
//                   arabic: quran[0],
//                   sura: bookmarkedSura - 1,
//                   suraName: arabicName[bookmarkedSura - 1]['name'] ?? '',
//                   ayah: bookmarkedAyah,
//                 ),
//               );
//             },
//             child: Text('Go to', style: miniStyle())),
//         const SizedBox(
//           width: 7,
//         ),
//         const Icon(
//           Icons.arrow_forward_ios,
//           color: Colors.white,
//           size: 13,
//         )
//       ],
//     );
//   }
// }

// class GotoForWidget extends StatelessWidget {
//   final VoidCallback? onpressed;
//   const GotoForWidget({Key? key, this.onpressed}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         InkWell(
//             onTap: () {
//               Push.to(context, const Qibla());
//             },
//             child: Text('Go to', style: miniStyle())),
//         const SizedBox(
//           width: 7,
//         ),
//         const Icon(
//           Icons.arrow_forward_ios,
//           color: Colors.white,
//           size: 13,
//         )
//       ],
//     );
//   }
// }
