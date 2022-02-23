import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'quiez_controller.dart';
import 'quiez_model.dart';

class QuiezView extends StatefulWidget {
  const QuiezView({Key? key}) : super(key: key);
  static const String pageName = '/quiez_view';
  @override
  State<QuiezView> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuiezView>
    with SingleTickerProviderStateMixin {
  //
  late AnimationController animationController;
  late Animation animation;
  late PageController pageController;

  ///
  @override
  void initState() {
    super.initState();
    final _provider = context.read<QuiezController>();
    // Our animation duration is 60 s
    // so our plan is to fill the progress bar within 60s
    animationController =
        AnimationController(duration: const Duration(seconds: 60), vsync: this);

    animation = Tween<double>(begin: 0, end: 1).animate(animationController)
      ..addListener(() {
        // update like setState
        setState(() {});
      });
    _provider.pageController = PageController();
    // _provider.animationController = PageController();
    // start our animation
    // Once 60s is completed go to the next qn
    animationController.forward().whenComplete(() {
      _provider.nextQuestion(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    // QuestionController _controller = Get.put(QuestionController());
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          // FlatButton(
          //   onPressed: _controller.nextQuestion,
          //   child: Text("Skip"),
          // ),
        ],
      ),
      body: Body(
        animationController: animationController,
      ),
    );
  }
}

// body
class Body extends StatelessWidget {
  const Body({
    Key? key,
    // required this.pageController,
    required this.animationController,
  }) : super(key: key);
  final AnimationController animationController;
  @override
  Widget build(BuildContext context) {
    // So that we have acccess our controller
    QuiezController _questionController = context.watch<QuiezController>();
    return Stack(
      children: [
        // SvgPicture.asset("assets/icons/bg.svg", fit: BoxFit.fill),
        SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProgressBar(animationController: animationController),
              Text.rich(
                TextSpan(
                  text: "Question ${_questionController.questionNumber}",
                  children: [
                    TextSpan(
                      text: "/${_questionController.questions.length}",
                    ),
                  ],
                ),
              ),
              const Divider(thickness: 1.5),
              Expanded(
                child: PageView.builder(
                  // Block swipe to next qn
                  physics: const NeverScrollableScrollPhysics(),
                  // controller: _questionController.pageController,
                  controller: _questionController.pageController,
                  onPageChanged: _questionController.updateTheQnNum,
                  itemCount: _questionController.questions.length,
                  itemBuilder: (context, index) => QuestionCard(
                      question: _questionController.questions[index]),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

// card question
class QuestionCard extends StatelessWidget {
  const QuestionCard({
    Key? key,
    // it means we have to pass this
    required this.question,
  }) : super(key: key);

  final QuiezModel question;

  @override
  Widget build(BuildContext context) {
    QuiezController _questionController = context.watch<QuiezController>();
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          Text(
            question.question,
          ),
          ...List.generate(
            question.options.length,
            (index) => Option(
              index: index,
              text: question.options[index].sugge,
              press: () =>
                  _questionController.checkAns(question, index, context),
            ),
          ),
        ],
      ),
    );
  }
}

class Option extends StatelessWidget {
  const Option({
    Key? key,
    required this.text,
    required this.index,
    required this.press,
  }) : super(key: key);
  final String text;
  final int index;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Consumer<QuiezController>(builder: (context, qnController, _) {
      Color getTheRightColor() {
        if (qnController.isAnswered) {
          if (index == qnController.correctAns) {
            return kGreenColor;
          } else if (index == qnController.selectedAns &&
              qnController.selectedAns != qnController.correctAns) {
            return kRedColor;
          }
        }
        return kGrayColor;
      }

      IconData getTheRightIcon() {
        return getTheRightColor() == kRedColor ? Icons.close : Icons.done;
      }

      return InkWell(
        onTap: press,
        child: Container(
          margin: EdgeInsets.only(top: kDefaultPadding),
          padding: EdgeInsets.all(kDefaultPadding),
          decoration: BoxDecoration(
            border: Border.all(color: getTheRightColor()),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${index + 1}. $text",
                style: TextStyle(color: getTheRightColor(), fontSize: 16),
              ),
              Container(
                height: 26,
                width: 26,
                decoration: BoxDecoration(
                  color: getTheRightColor() == kGrayColor
                      ? Colors.transparent
                      : getTheRightColor(),
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: getTheRightColor()),
                ),
                child: getTheRightColor() == kGrayColor
                    ? null
                    : Icon(getTheRightIcon(), size: 16),
              )
            ],
          ),
        ),
      );
    });
  }
}

// score
class ScoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    QuiezController _qnController = context.watch<QuiezController>();
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // SvgPicture.asset("assets/icons/bg.svg", fit: BoxFit.fill),
          Column(
            children: [
              Spacer(flex: 3),
              Text(
                "Score",
              ),
              Spacer(),
              Text(
                "${_qnController.correctAns * 10}/${_qnController.questions.length * 10}",
              ),
              Spacer(flex: 3),
            ],
          )
        ],
      ),
    );
  }
}

const kSecondaryColor = Color(0xFF8B94BC);
const kGreenColor = Color(0xFF6AC259);
const kRedColor = Color(0xFFE92E30);
const kGrayColor = Color(0xFFC1C1C1);
const kBlackColor = Color(0xFF101010);
const kPrimaryGradient = LinearGradient(
  colors: [Color(0xFF46A0AE), Color(0xFF00FFCB)],
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
);

const double kDefaultPadding = 20.0;

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    Key? key,
    required this.animationController,
  }) : super(key: key);
  final AnimationController animationController;
  @override
  Widget build(BuildContext context) {
    //  QuiezController controller = context.watch<QuiezController>();
    return Container(
        width: double.infinity,
        height: 35,
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xFF3F4768), width: 3),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Stack(
          children: [
            // LayoutBuilder provide us the available space for the conatiner
            // constraints.maxWidth needed for our animation
            LayoutBuilder(
              builder: (context, constraints) => Container(
                // from 0 to 1 it takes 60s
                width: constraints.maxWidth * animationController.value,
                decoration: BoxDecoration(
                  gradient: kPrimaryGradient,
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ),
            Positioned.fill(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("${(animationController.value * 60).round()} sec"),
                    // SvgPicture.asset("assets/icons/clock.svg"),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
