import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran/global/depency_injection.dart';
import 'package:quran/tools/convert_to_arabic_num.dart';
import 'package:quran/views/quiez/quiez_controller.dart';

import '../../styles/txt_style.dart';

///
class QuestionNumberWidget extends StatelessWidget {
  const QuestionNumberWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Consumer<QuiezController>(builder:
          (BuildContext context, QuiezController questionController, _) {
        final questionNumber = ConvertTo.toArabicNumber(
            questionController.questionNumber.toString());
        //
        final questionsLength = ConvertTo.toArabicNumber(
            questionController.questions.length.toString());

        //
        return Text.rich(
          TextSpan(
            text: " $questionNumber",
            children: [
              TextSpan(
                text: "/ $questionsLength سؤال ",
              ),
            ],
          ),
          style: TxtStyle.customStyle(
            fontSize: 20.0,
            color: DI.themeController(context).isDarkTheme
                ? Colors.white
                : DI.primaryColor(context),
          ),
        );
      }),
    );
  }
}
