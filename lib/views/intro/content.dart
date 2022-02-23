import 'package:flutter/material.dart';
import 'package:quran/models/on_boarding_model.dart';
import 'package:quran/widgets/txt.dart';

class Content extends StatelessWidget {
  const Content({Key? key, required this.model}) : super(key: key);
  final OnBoardingModel model;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: ListTile(
            title: Txt(
              model.tite,
              key: Key(model.tite),
              isUseFontSizePrefs: false,
              fontSize: 30.0,
            ),
            subtitle: Txt(
              model.tite,
              key: Key(model.tite),
              isUseFontSizePrefs: false,
              fontSize: 15.0,
            ),
          ),
        ),
        Expanded(
          flex: 4,
          child: Image.asset(model.img),
        ),
      ],
    );
  }
}
