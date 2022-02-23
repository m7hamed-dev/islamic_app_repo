import 'package:flutter/material.dart';
import 'package:quran/tools/copy.dart';

class IconCopy extends StatelessWidget {
  const IconCopy({Key? key, required this.text}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => Copy.toClipBoard(context, text),
        child: const Icon(Icons.copy));
    // color: Colors.grey.shade200,
  }
}
