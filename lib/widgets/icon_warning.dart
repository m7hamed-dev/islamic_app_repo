import 'package:flutter/material.dart';
import 'package:quran/tools/warning.dart';
import 'package:quran/widgets/circular_icon.dart';

class IconWarning extends StatelessWidget {
  const IconWarning({Key? key, required this.text}) : super(key: key);
  //
  final String text;
  //
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Warning.inCaseTxt(context, text),
      child: const CircleIcon(
        icon: Icons.warning_amber_outlined,
      ),
    );
  }
}
