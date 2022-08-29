import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: const Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: const DicePages(),
      ),
    ),
  );
}

// The below widget is a stateFull widget

class DicePages extends StatefulWidget {
  const DicePages({Key? key}) : super(key: key);

  @override
  State<DicePages> createState() => _DicePagesState();
}

int leftDiceNumber = 5;
int rightDiceNumber = 3;

class _DicePagesState extends State<DicePages> {
  void diceRoll() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: TextButton(
              onPressed: () {
                diceRoll();
              },
              child: Image.asset("images/dice$leftDiceNumber.png"),
            ),
          ),
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  rightDiceNumber = 2;
                });
              },
              child: Image.asset("images/dice$rightDiceNumber.png"),
            ),
          ),
        ],
      ),
    );
  }
}

// This below widget is a stateless widget

class DicePage extends StatelessWidget {
  const DicePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int leftDiceNumber = 5;
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: TextButton(
              onPressed: () {
                print('left dice');
              },
              child: Image.asset("images/dice$leftDiceNumber.png"),
            ),
          ),
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                print('right dice');
              },
              child: Image.asset("images/dice2.png"),
            ),
          ),
        ],
      ),
    );
  }
}
