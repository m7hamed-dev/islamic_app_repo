import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../widgets/txt.dart';
import '../quiez_controller.dart';

class CorrectAnswer extends StatelessWidget {
  const CorrectAnswer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<QuiezController>(
      builder: (context, value, _) {
        return Txt(
          '${value.numOfCorrectAns}',
          isUseFontSizePrefs: false,
          color: Colors.black,
          fontSize: 35.0,
        );
      },
    );
  }
}
