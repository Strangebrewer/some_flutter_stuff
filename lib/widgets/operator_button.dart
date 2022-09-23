import 'package:flutter/material.dart';

class OperatorButton extends StatelessWidget {
  final String buttonText;
  final Function handler;

  const OperatorButton(this.buttonText, this.handler, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(2),
      child: SizedBox(
        height: 50,
        width: 50,
        child: ElevatedButton(
          onPressed: handler(),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.white),
            foregroundColor: MaterialStateProperty.all(Colors.black),
          ),
          child: Text(buttonText),
        ),
      ),
    );
  }
}
