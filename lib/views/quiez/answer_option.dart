// import 'package:flutter/material.dart';
// import 'package:quran/views/quiez/quiez_controller.dart';
// import 'package:quran/widgets/txt.dart';

// class AnswerOption extends StatelessWidget {
//   const AnswerOption({
//     Key? key,
//     required this.text,
//     required this.index,
//     required this.questionId,
//     required this.onPressed,
//     required this.controller,
//   }) : super(key: key);

//   final String text;
//   final int index;
//   final int questionId;
//   final Function() onPressed;
//   final QuiezController controller;
// //هنا الويدجت بتاععت الاجابات
//   @override
//   Widget build(BuildContext context) {
//     //
//     return InkWell(
//         onTap:
//             controller.checkIsQuestionAnswered(questionId) ? null : onPressed,
//         child: Container(
//           width: double.infinity,
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(15),
//               border: Border.all(width: 3, color: controller.getColor(index))),
//           child: Padding(
//             padding: const EdgeInsets.all(15.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Txt(
//                   '${index + 1}. ',
//                   isUseFontSizePrefs: false,
//                   color: Colors.black,
//                 ),
//                 if (controller.checkIsQuestionAnswered(questionId) &&
//                     controller.selectAnswer == index)
//                   Container(
//                     width: 30,
//                     height: 30,
//                     padding: EdgeInsets.zero,
//                     alignment: Alignment.center,
//                     decoration: BoxDecoration(
//                       color: controller.getColor(index),
//                       border: Border.all(
//                         color: Colors.black,
//                         width: 3,
//                       ),
//                       shape: BoxShape.circle,
//                     ),
//                     child: Icon(
//                       controller.getIcon(index),
//                       color: Colors.black,
//                     ),
//                   )
//               ],
//             ),
//           ),
//         ));
//   }
// }
