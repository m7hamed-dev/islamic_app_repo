// import 'package:flutter/material.dart';
// import 'package:quran/views/quiez/quiez_controller.dart';
// import 'package:quran/views/quiez/quiez_model.dart';
// import 'package:quran/widgets/txt.dart';

// import 'answer_option.dart';

// class CardQuestion extends StatelessWidget {
//   const CardQuestion({
//     Key? key,
//     required this.quiezModel,
//     required this.controller,
//   }) : super(key: key);
//   //
//   final QuiezModel quiezModel;
//   final QuiezController controller;
//   //
//   @override
//   Widget build(BuildContext context) {
//     //
//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           Txt(
//             quiezModel.question,
//             isUseFontSizePrefs: false,
//             fontSize: 20.0,
//             color: Colors.black,
//           ),
//           ...List.generate(quiezModel.options.length, (index) {
//             return Column(
//               children: [
//                 AnswerOption(
//                   questionId: quiezModel.id,
//                   controller: controller,
//                   index: index,
//                   text: quiezModel.options[index].sugge,
//                   onPressed: () {
//                     controller.checkAnswer(quiezModel, index);
//                   },
//                 ),
//               ],
//             );
//           }).toList(),
//         ],
//       ),
//     );
//   }
// }
