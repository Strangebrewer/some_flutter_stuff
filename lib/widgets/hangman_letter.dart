import 'package:flutter/material.dart';

class HangmanLetter extends StatelessWidget {
  final String letter;
  final bool guessed;

  const HangmanLetter(this.letter, this.guessed, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      guessed ? letter : '_',
      style: const TextStyle(color: Colors.black),
    );
  }
}
