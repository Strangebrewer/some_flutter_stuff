import 'package:flutter/material.dart';

class OperatorButton extends StatelessWidget {
  final IconData icon;
  final Function handler;

  const OperatorButton(this.icon, this.handler, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(2),
      child: SizedBox(
        height: 50,
        width: 50,
        child: ElevatedButton(
          onPressed: () => handler(icon),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.white),
            foregroundColor: MaterialStateProperty.all(Colors.black),
          ),
          child: Icon(icon),
        ),
      ),
    );
  }
}
