import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen(this.startQuiz, {super.key});
  //
  final void Function() startQuiz;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 500,
            height: 300,
            // decoration: BoxDecoration(
            //   border: Border.all(width: 1, color: Colors.white),
            // ),
            child: Image.asset(
              'assets/images/quiz-logo.png',
              height: 50,
              width: 50,
              color: const Color.fromARGB(150, 255, 255, 255),
            ),
          ),
          const SizedBox(height: 50),
          const Text(
            'Learn Flutter the Fun Way!',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 30),
          ElevatedButton.icon(
            onPressed: startQuiz,
            label: const Text(
              'Start Quiz',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 27, 104, 167),
            ),
            icon: const Icon(Icons.arrow_right_alt),
          )
        ],
      ),
    );
  }
}
