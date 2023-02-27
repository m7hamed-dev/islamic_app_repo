import 'package:flutter/widgets.dart';
import 'package:quran/storage/local_storage.dart';
import 'package:quran/tools/push.dart';
import 'quiez_model.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'score_view.dart';

class QuiezController extends ChangeNotifier {
  //
  QuiezController() {
    _loadQuestions();
    getQuestionNumberFromPrefs;
  }

  //
  List<QuiezModel> _questions = <QuiezModel>[];
  //
  Future<void> _loadQuestions() async {
    questions.length = 0;
    String jsonString = await rootBundle.loadString('assets/json/quiez.json');
    _questions = questionModelFromJson(jsonString);
    _setCurrentQuestion();
    notifyListeners();
  }

  void _setCurrentQuestion() {
    currentQuestion = _questions[getQuestionNumberFromPrefs].question;
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
  //
  int get questionNumber =>
      isFirstTime ? _questionNumber : _valueOfQuestionNumberFromPrefs;

  int _numOfCorrectAns = 0;
  int get numOfCorrectAns => _numOfCorrectAns;
  //

  void checkAns(QuiezModel question, int selectedIndex, BuildContext context,
      AnimationController animationController) {
    // because once user press any option then it will run
    _isAnswered = true;
    _correctAns = question.answer;
    _selectedAns = selectedIndex;
    if (_correctAns == _selectedAns) _numOfCorrectAns++;
    _setCurrentQuestion();
    // It will stop the counter
    animationController.stop();
    notifyListeners();
    // Once user select an ans after 3s it will go to the next qn
    Future.delayed(const Duration(milliseconds: 1200), () {
      nextQuestion(context, animationController);
    });
  }

  late PageController pageController;
  //
  void nextQuestion(
      BuildContext context, AnimationController animationController) {
    if (_questionNumber != _questions.length) {
      //
      _isAnswered = false;
      //
      pageController.nextPage(
          duration: const Duration(milliseconds: 250), curve: Curves.ease);
      // Reset the counter
      animationController.reset();
      // Then start it again
      // Once timer is finish go to the next qn
      // animationController.forward();
      animationController.forward().whenComplete(() {
        animationController.reset();
        animationController.forward();
        //
        pageController.nextPage(
            duration: const Duration(milliseconds: 250), curve: Curves.ease);
      });
      _setCurrentQuestion();
    } else {
      Push.to(context, const ScoreView());
    }
  }

  void updateTheQnNum(int index) {
    _questionNumber = index + 1;
    _valueOfQuestionNumberFromPrefs = _questionNumber;
    _setCurrentQuestion();
    _saveQuestionNumberInPrefs();
  }

  void _saveQuestionNumberInPrefs() =>
      LocalStorage.saveIndex('questionNumber_key', _questionNumber);

  int _valueOfQuestionNumberFromPrefs = 1;

  int get getQuestionNumberFromPrefs {
    _valueOfQuestionNumberFromPrefs = LocalStorage.getInt('questionNumber_key');
    notifyListeners();
    debugPrint('getQuestionNumberFromPrefs () is calling ..........');
    return _valueOfQuestionNumberFromPrefs;
  }

  //
  bool get isFirstTime => _valueOfQuestionNumberFromPrefs == 1 ? true : false;

  String currentQuestion = '';

  ///
  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
    debugPrint('dispose from prviider ..............');
  }
}
