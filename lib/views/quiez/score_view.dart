import 'package:flutter/material.dart';
import 'package:quran/views/quiez/card_score.dart';

class ScoreView extends StatelessWidget {
  const ScoreView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const CardScore(),
    );
  }
}
