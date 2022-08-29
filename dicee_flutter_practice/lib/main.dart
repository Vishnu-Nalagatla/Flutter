import 'dart:ui';

import 'package:dicee_flutter_practice/Quizz/question.dart';
import 'package:flutter/material.dart';
import './Quizz/quizz_brain.dart';

QuizzBrain quizzBrain = QuizzBrain();

void main() => runApp(QuizzApp());

class QuizzApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
          backgroundColor: Color.fromARGB(255, 61, 60, 60),
          body: SafeArea(
            child: QuizzState(),
          )),
    );
  }
}

class QuizzState extends StatefulWidget {
  const QuizzState({Key? key}) : super(key: key);

  @override
  State<QuizzState> createState() => _QuizzStateState();
}

class _QuizzStateState extends State<QuizzState> {
  List<Widget> scoreKeeper = [];
  // List<String> questions = ["One", "Two", "Three", "Four", "Five"];
  // List<bool> answers = [false, true, false, false, true];
  void userAnswers(bool answer) {
    print(quizzBrain.currentQuestionNumber());
    print(quizzBrain.questionBankLength());

    setState(() {
      if (quizzBrain.questionBankLength() >
          quizzBrain.currentQuestionNumber()) {
        quizzBrain.nextQuestion();
        if (answer == quizzBrain.sendQuestionAnswer()) {
          scoreKeeper.add(const Icon(Icons.check, color: Colors.green));
          print("1111");
        } else {
          scoreKeeper.add(const Icon(Icons.close, color: Colors.red));
          print("2222");
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 7,
            child: Center(
              child: Text(
                quizzBrain.getQuestionText(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Card(
              color: Colors.green,
              child: TextButton(
                onPressed: () {
                  // userAnswers(true);
                  userAnswers(true);
                },
                child: const Text(
                  "True",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Card(
              color: Colors.red,
              child: TextButton(
                onPressed: () {
                  setState(() {
                    userAnswers(false);
                  });
                },
                child: const Text(
                  "False",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
                // mainAxisAlignment: MainAxisAlignment.end,
                children: scoreKeeper),
          )
        ],
      ),
    );
  }
}
