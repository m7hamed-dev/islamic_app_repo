// import 'package:flutter/material.dart';
// import 'package:quran/views/duaa/duaa_model.dart';
// import 'package:sleek_circular_slider/sleek_circular_slider.dart';
// import 'txt.dart';
// // import 'package:percent_indicator/percent_indicator.dart';

// class CustomSleekCircularSlider extends StatelessWidget {
//   const CustomSleekCircularSlider({
//     Key? key,
//     required this.detail,
//     required this.initValue,
//   }) : super(key: key);
//   //
//   final int initValue;
//   final Detail detail;
//   //
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         CircularPercentIndicator(
//           animation: initValue == detail.count ? true : false,
//           animationDuration: 2000,
//           radius: 25.0,
//           lineWidth: 13.0,
//           percent: 1.0,
//           progressColor: Theme.of(context).primaryColor,
//         ),
//         const SizedBox(height: 4),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Txt(
//               '${detail.count - detail.count}',
//               isUseFontSizePrefs: false,
//               fontSize: 20.0,
//             ),
//             const Txt(
//               '/',
//               isUseFontSizePrefs: false,
//               fontSize: 20.0,
//             ),
//             Txt(
//               '${detail.count}',
//               isUseFontSizePrefs: false,
//               fontSize: 20.0,
//             ),
//           ],
//         )
//       ],
//     );
//     //
//     return SleekCircularSlider(
//       min: 0.0,
//       max: detail.count + 0.0,
//       initialValue: detail.count + 0.0,
//       appearance: CircularSliderAppearance(
//         customWidths: CustomSliderWidths(progressBarWidth: 20.0),

//         customColors: CustomSliderColors(
//           // dotColor: Theme.of(context).primaryColor,
//           progressBarColor: Theme.of(context).primaryColor,
//           trackColor: Colors.pink,
//         ),
//         // spinnerDuration: 400,
//         animDurationMultiplier: 2.0,
//       ),
//       onChange: (double value) {
//         // value--;
//       },
//       onChangeStart: (double startValue) {},
//       onChangeEnd: (double endValue) {},
//       innerWidget: (double _) => Center(
//         child: Txt(
//           detail.count.toString(),
//           isUseFontSizePrefs: false,
//           fontSize: 20.0,
//         ),
//       ),
//     );
//   }
// }
