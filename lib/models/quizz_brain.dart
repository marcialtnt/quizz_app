import 'package:quizz_app/models/question.dart';

class QuizBrain {
  List<Question> _questions = [
    Question(questionText: '¿Existe la ciudad de Wuhan?', questionAnswer: true),
    Question(questionText: '¿La sopa de murciélago no existe?', questionAnswer: false),
    Question(questionText: '¿El SARS COVID-19 existe?', questionAnswer: true),
    Question(questionText: '¿La vacuna anti-covid funciona?', questionAnswer: false),
    Question(questionText: '¿Eres parte del rebaño?', questionAnswer: true),
  ];

  int _questionNumber = 0;

  String getQuestionText() {
    return _questions[_questionNumber].questionText;
  }

  bool getQuestionAnswer() {
    return _questions[_questionNumber].questionAnswer;
  }

  void nextQuestion() {
    _questionNumber++;
  }

  bool isFinished() {
    return (_questionNumber >= _questions.length - 1);
  }

  void restart() {
    _questionNumber = 0;
  }
}
