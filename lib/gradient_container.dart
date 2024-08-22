import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const startAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;

class GradientContainer extends StatelessWidget {
  const GradientContainer({required this.colors, super.key});
  final List<Color> colors;

  void startQuiz() {
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors,
          begin: startAlignment,
          end: endAlignment,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 500,
              child: Image.asset(
                "assets/images/quiz-logo.png",
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Learn Flutter the fun way",
              style: GoogleFonts.poppins(
                color: const Color.fromARGB(255, 237, 239, 235),
                fontWeight: FontWeight.w600,
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextButton(
              onPressed: startQuiz,
              style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  textStyle: const TextStyle(
                    fontSize: 20,
                  )),
              child: const Text(
                "Start Quiz",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
