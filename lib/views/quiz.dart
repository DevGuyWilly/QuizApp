import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/views/questions_screen.dart';
import 'package:quiz_app/views/result_screen.dart';
import 'package:quiz_app/views/welcome_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  final List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';

  //
  void chooseAnswers(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }

  // Default Screen, Start Screen
  void switchScreen() {
    setState(() {
      activeScreen = 'question-screen';
      selectedAnswers.removeRange(0, selectedAnswers.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = WelcomeScreen(switchScreen);

    // Render Question Screen
    if (activeScreen == 'question-screen') {
      screenWidget = QuestionScreen(onSelectAnswers: chooseAnswers);
    }

    // Render Result Screen
    if (activeScreen == 'result-screen') {
      screenWidget = ResultScreen(
        answeredQues: selectedAnswers,
        reStartWid: switchScreen,
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.red, Colors.blue],
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
