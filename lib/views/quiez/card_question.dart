import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran/animation/bottom_animation.dart';
import 'package:quran/tools/constants.dart';
import 'package:quran/widgets/txt.dart';
import 'card_option.dart';
import 'quiez_controller.dart';
import 'quiez_model.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    Key? key,
    required this.question,
    required this.animationController,
  }) : super(key: key);

  final QuiezModel question;
  final AnimationController animationController;

  ///
  @override
  Widget build(BuildContext context) {
    //
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Consumer<QuiezController>(
        builder: (context, _questionController, _) => Container(
          decoration: BoxDecoration(
            // color: Colors.white,
            borderRadius: BorderRadius.circular(25),
          ),
          child: ListView(
            physics: Constants.bouncScrollPhysics,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: BottomAnimator(
                  time: const Duration(milliseconds: 300),
                  child: Txt(
                    question.question,
                    isUseFontSizePrefs: false,
                    fontSize: 18.0,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              ...List.generate(
                question.options.length,
                (index) => BottomAnimator(
                  time: Duration(milliseconds: 300 + index * 300),
                  child: CardOption(
                    index: index,
                    text: question.options[index].sugge,
                    press: () => _questionController.checkAns(
                      question,
                      index,
                      context,
                      animationController,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
