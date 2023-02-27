import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran/animation/bottom_animation.dart';
import 'package:quran/global/depency_injection.dart';
import 'package:quran/widgets/btn.dart';
import 'package:quran/widgets/icon_settings.dart';
import 'package:quran/widgets/icon_share.dart';
import '../../global/custom_app_bar_shape.dart';
import '../../widgets/app_bar_title.dart';
import '../../widgets/icon_leading.dart';
import '../../widgets/txt.dart';
import 'quiez_body.dart';
import 'quiez_controller.dart';

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
  late QuiezController _quiezController;
//
  void _initPageController() {
    //
    _quiezController.pageController = PageController(
        initialPage:
            _quiezController.isFirstTime ? 1 : _quiezController.questionNumber);
  }

  void _initQuizController() {
    if (!mounted) {
      return;
    }
    _quiezController = context.read<QuiezController>();
    _question = _quiezController.currentQuestion;
  }

  String _question = '';

  ///
  @override
  void initState() {
    super.initState();
    //
    _initQuizController();
    // Our animation duration is 60 s
    // so our plan is to fill the progress bar within 60s
    animationController =
        AnimationController(duration: const Duration(seconds: 60), vsync: this);

    animation = Tween<double>(begin: 0, end: 1).animate(animationController)
      ..addListener(() {
        setState(() {});
      });
    //
    _initPageController();
    // start our animation
    // Once 60s is completed go to the next qn
    animationController.forward().whenComplete(() {
      _quiezController.nextQuestion(context, animationController);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const AppBarTitle('اسئله إسلاميه'),
        actions: [
          const IconSettings(),
          _question.isEmpty ? const SizedBox() : IconShare(text: _question)
        ],
        shape: CustomAppBarShape(),
        leading: const IconLeading(),
      ),
      body: Body(animationController: animationController),
      bottomNavigationBar: BottomAnimator(
        time: const Duration(milliseconds: 1200),
        child: Btn(
          margin: const EdgeInsets.all(10.0),
          padding: const EdgeInsets.all(10.0),
          color: DI.primaryColor(context),
          onPressed: () => context
              .read<QuiezController>()
              .nextQuestion(context, animationController),
          child: const Txt(
            "تخطي",
            isUseFontSizePrefs: false,
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    debugPrint('..................... dispose .....................');
    // context.read<QuiezController>().resetNumberOfCorrectAns();
    animationController.dispose();
    super.dispose();
  }
}

const kSecondaryColor = Color(0xFF8B94BC);
const kGreenColor = Color(0xFF6AC259);
const kRedColor = Color(0xFFE92E30);
const kGrayColor = Color(0xFFC1C1C1);
const kBlackColor = Color(0xFF101010);
// const kPrimaryGradient = LinearGradient(
//   colors: [
//     // Color(0xFF46A0AE),
//     // Color(0xFF00FFCB),
//   ],
//   begin: Alignment.centerLeft,
//   end: Alignment.centerRight,
// );
