import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.switchScreen, {super.key});

  final void Function() switchScreen;
  void startQuiz() {
    switchScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            "assets/images/quiz-logo.png",
            fit: BoxFit.contain,
            width: 300,
            color: const Color.fromARGB(150, 255, 255, 255),
          ),

          // this is performance intensive, so avoid it if possible
          // Opacity(
          //   opacity: 0.6,
          //   child: Image.asset(
          //     "assets/images/quiz-logo.png",
          //     fit: BoxFit.contain,
          //     width: 300,
          //   ),
          // ),
          const SizedBox(height: 50),
          Text(
            "Welcome to our Quiz App!",
            style: GoogleFonts.openSans(
              color: const Color.fromARGB(255, 237, 223, 252),
              fontSize: 24,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            icon: const Icon(
              Icons.arrow_right_alt_sharp,
            ),
            label: const Text(
              "Start Quiz",
            ),
          ),
        ],
      ),
    );
  }
}
