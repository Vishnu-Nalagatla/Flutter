import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  bool _customTileExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const ExpansionTile(
          title: Text('ExpansionTile 1'),
          subtitle: Text('Trailing expansion arrow icon'),
          children: <Widget>[
            ListTile(title: Text('This is tile number 1')),
          ],
        ),
        ExpansionTile(
          title: const Text('ExpansionTile 2'),
          subtitle: const Text('Custom expansion arrow icon'),
          trailing: Icon(
            _customTileExpanded
                ? Icons.arrow_drop_down_circle
                : Icons.arrow_drop_down,
          ),
          children: const <Widget>[
            ListTile(title: Text('This is tile number 2')),
          ],
          onExpansionChanged: (bool expanded) {
            setState(() => _customTileExpanded = expanded);
          },
        ),
        const ExpansionTile(
          title: Text('ExpansionTile 3'),
          subtitle: Text('Leading expansion arrow icon'),
          controlAffinity: ListTileControlAffinity.leading,
          children: <Widget>[
            ListTile(title: Text('This is tile number 3')),
          ],
        ),
      ],
    );
  }
}


// import 'dart:ui';

// import 'package:dicee_flutter_practice/Quizz/question.dart';
// import 'package:flutter/material.dart';
// import './Quizz/quizz_brain.dart';

// QuizzBrain quizzBrain = QuizzBrain();

// void main() => runApp(QuizzApp());

// class QuizzApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: Scaffold(
//           backgroundColor: Color.fromARGB(255, 61, 60, 60),
//           body: SafeArea(
//             child: QuizzState(),
//           )),
//     );
//   }
// }

// class QuizzState extends StatefulWidget {
//   const QuizzState({Key? key}) : super(key: key);

//   @override
//   State<QuizzState> createState() => _QuizzStateState();
// }

// class _QuizzStateState extends State<QuizzState> {
//   List<Widget> scoreKeeper = [];
//   // List<String> questions = ["One", "Two", "Three", "Four", "Five"];
//   // List<bool> answers = [false, true, false, false, true];
//   void userAnswers(bool answer) {
//     print(quizzBrain.currentQuestionNumber());
//     print(quizzBrain.questionBankLength());

//     setState(() {
//       if (quizzBrain.questionBankLength() >
//           quizzBrain.currentQuestionNumber()) {
//         quizzBrain.nextQuestion();
//         if (answer == quizzBrain.sendQuestionAnswer()) {
//           scoreKeeper.add(const Icon(Icons.check, color: Colors.green));
//           print("1111");
//         } else {
//           scoreKeeper.add(const Icon(Icons.close, color: Colors.red));
//           print("2222");
//         }
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.fromLTRB(20, 20, 20, 30),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: <Widget>[
//           Expanded(
//             flex: 7,
//             child: Center(
//               child: Text(
//                 quizzBrain.getQuestionText(),
//                 style: const TextStyle(
//                   color: Colors.white,
//                   fontSize: 25,
//                 ),
//               ),
//             ),
//           ),
//           Expanded(
//             flex: 1,
//             child: Card(
//               color: Colors.green,
//               child: TextButton(
//                 onPressed: () {
//                   // userAnswers(true);
//                   userAnswers(true);
//                 },
//                 child: const Text(
//                   "True",
//                   style: TextStyle(color: Colors.white),
//                 ),
//               ),
//             ),
//           ),
//           Expanded(
//             flex: 1,
//             child: Card(
//               color: Colors.red,
//               child: TextButton(
//                 onPressed: () {
//                   setState(() {
//                     userAnswers(false);
//                   });
//                 },
//                 child: const Text(
//                   "False",
//                   style: TextStyle(color: Colors.white),
//                 ),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(top: 20),
//             child: Row(
//                 // mainAxisAlignment: MainAxisAlignment.end,
//                 children: scoreKeeper),
//           )
//         ],
//       ),
//     );
//   }
// }
