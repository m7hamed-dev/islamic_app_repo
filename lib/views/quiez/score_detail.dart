// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:quran/views/quiez/quiez_controller.dart';
// import 'package:quran/views/quiez/quiez_view.dart';
// import 'package:quran/widgets/txt.dart';

// class ScoreDetails extends StatelessWidget {
//   const ScoreDetails({Key? key}) : super(key: key);
//   //
//   @override
//   Widget build(BuildContext context) {
//     //
//     return Consumer<QuiezController>(
//       builder: (context, controller, child) {
//         return Container(
//           height: 90.0,
//           // duration: const Duration(milliseconds: 600),
//           // width: ScreenUtil.getWidth(context),
//           padding: const EdgeInsets.all(10.0),
//           margin: const EdgeInsets.all(5.0),
//           decoration: BoxDecoration(
//             color: Colors.red,
//             borderRadius: BorderRadius.circular(10.0),
//           ),
//           child: Row(
//             children: [
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const ProgressTimer(),
//                   Txt('All Questions =  ${controller.scoreResult / 100}'),
//                 ],
//               ),
//               // const Spacer(),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: InkWell(
//                   onTap: () {
//                     //  controller
//                   },
//                   child: const Icon(Icons.restore),
//                 ),
//               ),
//               // const Spacer(),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: InkWell(
//                   onTap: () {
//                     controller.startTimer();
//                   },
//                   child: const Icon(Icons.restore),
//                 ),
//               )
//               // Column(
//               //   crossAxisAlignment: CrossAxisAlignment.start,
//               //   children: [
//               //     Txt(quiezController.totalScore.toString()),
//               //     Txt(quiezController.level.toString()),
//               //   ],
//               // ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
