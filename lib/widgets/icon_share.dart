import 'package:flutter/material.dart';
import 'package:quran/tools/custom_share.dart';
import 'package:quran/widgets/circular_icon.dart';

class IconShare extends StatelessWidget {
  const IconShare({Key? key, required this.text}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => CustomShare.shareTxt(text),
      child: CircleIcon(
        icon: Icons.share,
        colorCircle: Colors.grey.shade200,
        colorIcon: Colors.green,
      ),
    );
  }
}
