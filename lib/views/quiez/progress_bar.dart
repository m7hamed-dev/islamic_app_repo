import 'package:flutter/material.dart';
import 'package:quran/tools/convert_to_arabic_num.dart';

import '../../widgets/txt.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    Key? key,
    required this.animationController,
  }) : super(key: key);
  final AnimationController animationController;
  //
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 40.0,
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xFF3F4768),
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(50.0),
      ),
      child: Stack(
        children: [
          // LayoutBuilder provide us the available space for the conatiner
          // constraints.maxWidth needed for our animation
          LayoutBuilder(
            builder: (context, constraints) {
              // debugPrint(
              //     ' animationController.value = ${animationController.value}');
              // debugPrint(
              // 'value = ${constraints.maxWidth * animationController.value}');
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                // from 0 to 1 it takes 60s
                width: constraints.maxWidth * animationController.value,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Theme.of(context).primaryColor.withOpacity(.12),
                    Theme.of(context).primaryColor.withOpacity(.40),
                    Theme.of(context).primaryColor.withOpacity(.60),
                    Theme.of(context).primaryColor.withOpacity(.80),
                  ]),
                  borderRadius: BorderRadius.circular(20.0),
                ),
              );
            },
          ),
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Txt(
                    ConvertTo.toArabicNumber(
                        " ثانيه ${(animationController.value * 60).round()}"),
                    isUseFontSizePrefs: false,
                    fontSize: 16.0,
                  ),
                  const Icon(Icons.timer),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
