import 'package:flutter/material.dart';
import 'package:flutter_fluff/widgets/hangman_letter.dart';

class HangmanScreen extends StatelessWidget {
  static const routeName = '/hangman';
  final String title;
  String word = '';
  final List<Map<String, bool>> letters = [];

  HangmanScreen({Key? key, required this.title}) : super(key: key);

  // the logic for this could look something like:
  // An array of letter objects, with the letter property and the guessed property
  // The letters display is a Row whose children prop is a map of letters array
  //  mapped to a HangmanLetter.
  // When you guess a letter, it checks the array; if it's wrong, the letter is added to
  //  a wrong-guesses array, which is also displayed. If it's correct, the "guessed" prop
  //  for that letter is flipped to true.
  // When the wrong-guesses array reaches a certain length, the game is lost.
  // When all letters have been guessed correctly, the game is won.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              width: 2,
              color: const Color.fromRGBO(66, 102, 54, 1),
            ),
          ),
          child: Column(
            children: [
              const Text('Hi, man. Hang on!'),
              Row(
                children: const [
                  HangmanLetter('B', false),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
