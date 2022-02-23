import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:quran/tools/screen_util.dart';
import 'package:quran/widgets/custom_card.dart';
import 'package:quran/widgets/txt.dart';
import 'quiez_controller.dart';
import 'quiez_model.dart';

class CardSuggestion extends StatelessWidget {
  const CardSuggestion({
    Key? key,
    required this.question,
    required this.questionIndex,
  }) : super(key: key);
  //
  final int questionIndex;
  final QuiezModel question;
  //

  @override
  Widget build(BuildContext context) {
    return Container(
      // duration: const Duration(milliseconds: 600),
      width: ScreenUtil.getWidth(context),
      // color: _questionController.backColor,
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // _buildTimerQuestion(context),
          SizedBox(
            width: ScreenUtil.getWidth(context),
            child: Txt(
              question.question,
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: ScreenUtil.getHeight(context) * 0.06,
          ),

          /// first btn
          InkWell(
            // onTap: () => context.read<QuiezController>().onTapBtnAnswer(
            //       context,
            //       suggIndex: 0,
            //       questionIndex: questionIndex,
            //       question: question,
            //       questionController: context.read<QuiezController>(),
            //     ),
            child: CustomCard(
              width: double.infinity,
              padding: const EdgeInsets.all(10.0),
              margin: const EdgeInsets.all(10.0),
              // color: _questionController.colorCardSugg,
              child: Txt(
                question.options[0].sugge,
              ),
            ),
          ),
          // btn 2
          InkWell(
            // onTap: () => context.read<QuiezController>().onTapBtnAnswer(
            //       context,
            //       suggIndex: 1,
            //       questionIndex: questionIndex,
            //       question: question,
            //       questionController: context.read<QuiezController>(),
            //     ),
            child: CustomCard(
              width: double.infinity, padding: const EdgeInsets.all(10.0),
              margin: const EdgeInsets.all(10.0),
              // color: _questionController.colorCardSugg,
              child: Txt(
                question.options[1].sugge,
              ),
            ),
          ),
          // btn 3
          InkWell(
            // onTap: () => context.read<QuiezController>().onTapBtnAnswer(
            //       context,
            //       suggIndex: 2,
            //       questionIndex: questionIndex,
            //       question: question,
            //       questionController: context.read<QuiezController>(),
            //     ),
            child: CustomCard(
              width: double.infinity,
              padding: const EdgeInsets.all(10.0),
              margin: const EdgeInsets.all(10.0),
              // color: _questionController.colorCardSugg,
              child: Txt(
                question.options[2].sugge,
              ),
            ),
          ),
          const SizedBox(height: 30.0),
        ],
      ),
    );
  }

  Widget _buildTimerQuestion(BuildContext context) {
    print('build _buildTimerQuestion');
    return TweenAnimationBuilder(
      tween: Tween(begin: 30.0, end: 0.0),
      duration: const Duration(seconds: 10),
      builder: (BuildContext context, dynamic value, Widget? child) {
        return Text(value.toString());
      },
    );
  }
}
