import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../models/quizz_brain.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _HomePageState();
}

class _HomePageState extends State<MyHomePage> {
  QuizBrain quizzBrain = QuizBrain();
  List<Icon> scoreKeeper = [];

  void checkQuestion(bool type) {
    if (quizzBrain.isFinished() == true) {
      Alert(
        context: context,
        type: AlertType.success,
        title: '¡Quizz finalizado!',
        desc: '¿Iniciar nuevamente?',
        buttons: [
          DialogButton(
            child: Text(
              'Reiniciar',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () {
              quizzBrain.restart();
              scoreKeeper.clear();
              Navigator.pop(context);
              setState(() {});
            },
            width: 120,
          )
        ],
      ).show();
    } else {
      bool correctAnswer = quizzBrain.getQuestionAnswer();
      if (correctAnswer == type) {
        scoreKeeper.add(
          Icon(
            Icons.check,
            color: Colors.green,
          ),
        );
      } else {
        scoreKeeper.add(
          Icon(
            Icons.close,
            color: Colors.red,
          ),
        );
      }
      setState(() {});
      quizzBrain.nextQuestion();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2b2d42),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 5,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  quizzBrain.getQuestionText(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                onPressed: () {
                  checkQuestion(true);
                },
                color: Color(0xff3bceac),
                child: Text(
                  'Verdadero',
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                onPressed: () {
                  checkQuestion(false);
                },
                color: Color(0xffff6b6b),
                child: Text(
                  'Falso',
                ),
              ),
            ),
          ),
          Row(
            children: scoreKeeper,
          ),
        ],
      ),
    );
  }
}
