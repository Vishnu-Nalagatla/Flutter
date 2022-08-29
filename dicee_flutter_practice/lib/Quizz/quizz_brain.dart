import 'question.dart';

class QuizzBrain {
  int _questionNumber = 0;

  List<Question> _questionBank = [
    Question(q: "One", a: true),
    Question(q: "Two", a: true),
    Question(q: "Three", a: true),
    Question(q: "Four", a: false),
    Question(q: "Five", a: true),
  ];

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  int currentQuestionNumber() {
    return _questionNumber;
  }

  int questionBankLength() {
    return _questionBank.length;
  }

  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  bool sendQuestionAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }
}
