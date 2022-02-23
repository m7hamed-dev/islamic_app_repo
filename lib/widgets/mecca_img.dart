import 'package:flutter/material.dart';

class MeccaImg extends StatelessWidget {
  const MeccaImg({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/arabic_quran/Mecca.png',
      width: 30.0,
      height: 30.0,
    );
  }
}
