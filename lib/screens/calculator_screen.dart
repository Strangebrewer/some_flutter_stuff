import 'package:flutter/material.dart';
import 'package:flutter_fluff/screens/hangman_screen.dart';
import 'package:flutter_fluff/widgets/number_button.dart';

class CalculatorScreen extends StatefulWidget {
  final String title;

  const CalculatorScreen({Key? key, required this.title}) : super(key: key);

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  List<double> values = [];
  bool cleared = true;
  List<String> currentValues = ['0'];

  completeValue() {
    // take all items in currentValues and convert them to a double
    String currentNumber = currentValues.join("");
    values.add(double.parse(currentNumber));
    currentValues.clear();
    currentValues.add(currentNumber);
  }

  reset() {
    setState(() {
      currentValues.clear();
      currentValues.add('0');
    });
  }

  void addValue(String value) {
    if (currentValues.length == 1 && currentValues[0] == '0') {
      currentValues.clear();
    }
    setState(() {
      currentValues.add(value);
    });
  }

  add(String _) {
    completeValue();
    // then do the operation
    setState(() {
      currentValues.add(' + ');
    });
    // blah blah blah - I could work out the calculator logic, but that isn't the challenge, here
    // The challenge is learning Flutter, not basic programming logic.
    //  And learning Flutter, in this sense, means tossing out most of what I know
    //    of html and CSS and learning Flutter's way of positioning things
    //    (and state and db connections and all that, too, but later)
  }

  subtract() {}

  multiply() {}

  divide() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          width: 232,
          height: 344,
          padding: const EdgeInsets.fromLTRB(6, 6, 6, 2),
          decoration: BoxDecoration(
            color: const Color.fromRGBO(55, 202, 127, 0.2),
            border: Border.all(
              width: 2,
              color: const Color.fromRGBO(66, 102, 54, 1),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 216,
                height: 60,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: const Color.fromARGB(255, 192, 192, 192),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Row(
                    children: [
                      const Spacer(),
                      ...currentValues
                          .map((e) =>
                              Text(e, style: const TextStyle(fontSize: 24)))
                          .toList()
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  NumberButton('1', addValue),
                  NumberButton('2', addValue),
                  NumberButton('3', addValue),
                  NumberButton('/', divide),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  NumberButton('4', addValue),
                  NumberButton('5', addValue),
                  NumberButton('6', addValue),
                  NumberButton('X', multiply),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  NumberButton('7', addValue),
                  NumberButton('8', addValue),
                  NumberButton('9', addValue),
                  NumberButton('-', subtract),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  NumberButton('C', (_) => reset()),
                  NumberButton('0', addValue),
                  NumberButton('.', addValue),
                  NumberButton('+', add),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: completeValue,
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      foregroundColor: MaterialStateProperty.all(Colors.black),
                    ),
                    child: const Icon(Icons.backspace),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(2),
                    child: ElevatedButton(
                      onPressed: completeValue,
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                        foregroundColor:
                            MaterialStateProperty.all(Colors.black),
                      ),
                      child: const Text('='),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(HangmanScreen.routeName);
        },
        tooltip: 'Clear',
        child: const Icon(Icons.reset_tv),
      ),
    );
  }
}
