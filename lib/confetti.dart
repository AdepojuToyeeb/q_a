import 'dart:math';
import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
// declare confettiController;
  late ConfettiController _topController;

  @override
  void initState() {
    super.initState();

    // initialize confettiController
    _topController = ConfettiController(duration: const Duration(seconds: 10));
  }

  @override
  void dispose() {
    // dispose the controller
    _topController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("GeeksForGeeks"),
          backgroundColor: Colors.green,
          centerTitle: true,
        ),
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Stack(
            children: <Widget>[
              // align the confetti on the screen
              Align(
                alignment: Alignment.topCenter,
                child: ConfettiWidget(
                  confettiController: _topController,
                  blastDirection: pi / 2,
                  maxBlastForce: 5,
                  minBlastForce: 1,
                  emissionFrequency: 0.01,
                  numberOfParticles: 20,
                  gravity: 1,
                  shouldLoop: true,
                  colors: const [
                    Colors.green,
                    Colors.yellow,
                    Colors.pink,
                    Colors.orange,
                    Colors.blue
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
