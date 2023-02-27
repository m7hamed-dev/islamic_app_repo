import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran/views/quiez/question_number_widget.dart';
import 'card_question.dart';
import 'progress_bar.dart';
import 'quiez_controller.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
    required this.animationController,
  }) : super(key: key);
  //
  final AnimationController animationController;
  //
  @override
  Widget build(BuildContext context) {
    //
    return Consumer<QuiezController>(
      builder: (context, _questionController, _) {
        //
        return Stack(
          children: [
            // SvgPicture.asset("assets/icons/bg.svg", fit: BoxFit.fill),
            SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //
                  ProgressBar(animationController: animationController),
                  //
                  const QuestionNumberWidget(),
                  //
                  const Divider(thickness: 1.5),
                  //
                  Expanded(
                    child: PageView.builder(
                      // Block swipe to next qn
                      physics: const NeverScrollableScrollPhysics(),
                      controller: _questionController.pageController,
                      onPageChanged: _questionController.updateTheQnNum,
                      itemCount: _questionController.questions.length,
                      itemBuilder: (context, index) {
                        return QuestionCard(
                          question: _questionController.questions[index],
                          animationController: animationController,
                        );
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
