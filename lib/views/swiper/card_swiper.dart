import 'package:flutter/material.dart';
import 'package:quran/styles/txt_style.dart';

class CardSwiper extends StatelessWidget {
  const CardSwiper({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(10.0),
      child: Text(
        title,
        textAlign: TextAlign.end,
        style: TxtStyle.customStyle(fontSize: 18.0),
      ),
    );
  }
}
