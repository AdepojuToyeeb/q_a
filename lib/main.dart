import 'package:flutter/material.dart';
// import 'package:quiz_app/gradient_container.dart';
import 'package:quiz_app/start_screen.dart';

void main() {
  runApp(const MyApp());
}

const startAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(255, 107, 15, 168),
              ],
              begin: startAlignment,
              end: endAlignment,
            ),
          ),
          child: const StartScreen(),
        ),
      ),
    );
  }
}
