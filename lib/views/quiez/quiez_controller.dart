import 'package:flutter/widgets.dart';
import 'package:quran/tools/push.dart';
import 'quiez_model.dart';
import 'quiez_view.dart';
import 'package:flutter/services.dart' show rootBundle;

class QuiezController extends ChangeNotifier {
  QuiezController() {
    _loadQuestions();
  }
  List<QuiezModel> _questions = <QuiezModel>[];
  //
  Future<void> _loadQuestions() async {
    questions.length = 0;
    String jsonString = await rootBundle.loadString('assets/json/quiez.json');
    _questions = questionModelFromJson(jsonString);
    debugPrint('_questions = ${_questions.length}');
    notifyListeners();
  }

  ///
  List<QuiezModel> get questions => _questions;

  bool _isAnswered = false;
  bool get isAnswered => _isAnswered;

  late int _correctAns;
  int get correctAns => _correctAns;

  late int _selectedAns;
  int get selectedAns => _selectedAns;

  // for more about obs please check documentation
  int _questionNumber = 1;
  int get questionNumber => _questionNumber;

  int _numOfCorrectAns = 0;
  int get numOfCorrectAns => _numOfCorrectAns;

  void checkAns(QuiezModel question, int selectedIndex, BuildContext context) {
    // because once user press any option then it will run
    _isAnswered = true;
    _correctAns = question.answer;
    _selectedAns = selectedIndex;
    if (_correctAns == _selectedAns) _numOfCorrectAns++;
    // It will stop the counter
    // _animationController.stop();
    notifyListeners();
    // Once user select an ans after 3s it will go to the next qn
    Future.delayed(const Duration(seconds: 2), () {
      nextQuestion(context);
    });
  }

  late PageController pageController;
  // late AnimationController animationController;
  // late Animation animation;
  //
  void nextQuestion(BuildContext context) {
    if (_questionNumber != _questions.length) {
      _isAnswered = false;
      pageController.nextPage(
          duration: const Duration(milliseconds: 250), curve: Curves.ease);
      // Reset the counter
      // animationController.reset();
      // Then start it again
      // Once timer is finish go to the next qn
      // _animationController.forward().whenComplete(nextQuestion);
    } else {
      // Get package provide us simple way to naviigate another page
      Push.to(context, ScoreScreen());
    }
  }

  void updateTheQnNum(int index) {
    _questionNumber = index + 1;
  }
}
