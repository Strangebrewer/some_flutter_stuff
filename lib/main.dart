import 'package:flutter/material.dart';
import 'package:flutter_fluff/widgets/number_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Calculator',
      theme: ThemeData(
        colorScheme: const ColorScheme(
          primary: Colors.purple,
          onPrimary: Colors.deepOrange,
          secondary: Colors.deepOrange,
          onSecondary: Colors.purple,
          tertiary: Colors.green,
          onTertiary: Colors.purple,
          brightness: Brightness.light,
          error: Colors.red,
          onError: Colors.white,
          background: Colors.white,
          onBackground: Colors.black87,
          surface: Colors.green,
          onSurface: Colors.lightBlue,
        ),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<double> values = [];
  List<String> currentValues = ['0'];

  completeValue() {
    // take all items in currentValues and convert them to a double
  }

  void addValue(String value) {
    if (currentValues.length == 1 && currentValues[0] == '0') {
      currentValues.clear();
    }
    setState(() {
      currentValues.add(value);
    });
  }

  add() {}

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
                NumberButton('!', () {}),
                NumberButton('0', addValue),
                NumberButton('.', addValue),
                NumberButton('+', add),
              ],
            ),
            // ElevatedButton(onPressed: completeValue, child: const Text('='))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Clear',
        child: const Icon(Icons.reset_tv),
      ),
    );
  }
}
