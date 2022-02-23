import 'package:flutter/material.dart';

class MdinaImg extends StatelessWidget {
  const MdinaImg({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/arabic_quran/Medina.png',
      width: 30.0,
      height: 30.0,
    );
  }
}
