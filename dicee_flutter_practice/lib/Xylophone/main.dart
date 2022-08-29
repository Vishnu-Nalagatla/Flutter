import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Xylophone'),
          backgroundColor: Colors.red,
        ),
        body: Xylophone(),
      ),
    ),
  );
}

class Xylophone extends StatefulWidget {
  Xylophone({Key? key}) : super(key: key);

  @override
  State<Xylophone> createState() => _XylophoneState();
}

class _XylophoneState extends State<Xylophone> {
  Expanded colorBlocks(Color Color) {
    return Expanded(
      child: Container(
        color: Color,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: <Widget>[
        colorBlocks(Colors.red),
        colorBlocks(Colors.green),
        colorBlocks(Colors.blue),
        colorBlocks(Colors.orange),
        colorBlocks(Colors.black),
        colorBlocks(Colors.brown),
      ],
    ));
  }
}
