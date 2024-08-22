import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summary.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen(
      {super.key, required this.onBackPress, required this.chosenAnswers});
  final void Function() onBackPress;
  final List<String> chosenAnswers;

  @override
  State<ResultScreen> createState() {
    return _ResultScreenState();
  }
}

class _ResultScreenState extends State<ResultScreen> {
  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < widget.chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': widget.chosenAnswers[i]
      });
    }
    return summary;
  }

  final ConfettiController _centerController =
      ConfettiController(duration: const Duration(seconds: 100));

  @override
  void dispose() {
    // dispose the controller
    _centerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isAllCorrect = false;
    final numTotalQuestions = questions.length;
    final summaryData = getSummaryData();
    final numCorrectQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;
    if (numCorrectQuestions == numTotalQuestions) {
      setState(() {
        isAllCorrect = true;
      });
    }

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isAllCorrect
                ? Align(
                    alignment: Alignment.topCenter,
                    child: ConfettiWidget(
                      confettiController: _centerController,
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
                  )
                : ConfettiWidget(
                    confettiController: _centerController,
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
            Text(
              'you answered $numCorrectQuestions out of $numTotalQuestions questions corectly'
                  .toUpperCase(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            QuestionsSummary(summaryData),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: widget.onBackPress,
              child: const Text("Restart Quiz"),
            )
          ],
        ),
      ),
    );
  }
}
