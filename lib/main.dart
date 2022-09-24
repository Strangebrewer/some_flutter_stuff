import 'package:flutter/material.dart';
import 'package:flutter_fluff/screens/calculator_screen.dart';
import 'package:flutter_fluff/screens/hangman_screen.dart';

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
      home: const CalculatorScreen(title: 'Muy Calculatore!'),
      routes: {
        HangmanScreen.routeName: (ctx) => HangmanScreen(title: 'Hangoverman!'),
      },
    );
  }
}
