import 'package:flutter/material.dart';
import 'package:quran/widgets/txt.dart';

class CardIntro extends StatelessWidget {
  final Widget imgWidget;
  final String title;
  final String subtitle;
  final Color color;
  final int index;
  // final VoidCallback onNext;

  const CardIntro({
    Key? key,
    required this.imgWidget,
    required this.title,
    required this.subtitle,
    required this.color,
    required this.index,
    // required this.onNext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      color: index == 0
          ? Colors.red
          : index == 1
              ? Colors.yellow
              : Colors.purple,
      child: Column(
        children: [
          imgWidget,
          Txt(
            title,
            isUseFontSizePrefs: false,
            fontSize: 40.0,
            fontWeight: FontWeight.bold,
          ),
        ],
      ),
    );
  }
}
