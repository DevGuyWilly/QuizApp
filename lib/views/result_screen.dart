import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/views/quiz.dart';
import 'package:quiz_app/views/welcome_screen.dart';

class ResultScreen extends StatelessWidget {
  final List<String> answeredQues;
  final void Function() reStartWid;
  const ResultScreen(
      {required this.reStartWid, required this.answeredQues, super.key});

  @override
  Widget build(BuildContext context) {
    // Check Number of Questions
    var ques = questions.length;

    // Counter for correct number of questions
    var correct = 0;
    // Check number of correct answers
    for (var i = 0; i < questions.length; i++) {
      if (questions[i].answer.first == answeredQues[i]) {
        correct++;
      }
    }

    //Full Width of Screen
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: screenWidth,
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        // border: Border.all(width: 1, color: Colors.white),
        gradient: LinearGradient(
          colors: [Colors.red, Colors.blue],
          begin: Alignment.bottomRight,
          end: Alignment.topLeft,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'You have answered $correct out of $ques correctly',
            style: const TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 400,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Expanded(
                child: Column(
                  children: [
                    ...questions.map(
                      (e) => ReviewedWidget(
                        // Render List in Widget
                        pickedAns: answeredQues[int.parse(e.numb) - 1],
                        questionNum: e.numb,
                        qestion: e.text,
                        correctAns: e.answer.first,
                        decisionColor: answeredQues[int.parse(e.numb) - 1] ==
                                e.answer.first
                            ? Colors.blue
                            : Colors.red,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 27, 104, 167),
            ),
            onPressed: () {
              WelcomeScreen(reStartWid);
            },
            child: const Text(
              'Try Again!',
            ),
          ),
        ],
      ),
    );
  }
}

class ReviewedWidget extends StatelessWidget {
  final String questionNum;
  final String qestion;
  final String correctAns;
  final String pickedAns;
  final Color? decisionColor;
  const ReviewedWidget({
    required this.decisionColor,
    required this.correctAns,
    required this.qestion,
    required this.questionNum,
    required this.pickedAns,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 90,
      decoration: const BoxDecoration(
          // border: Border.all(width: 1, color: Colors.white),
          ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Container(
              width: 25,
              height: 25,
              alignment: Alignment.center,
              margin: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                color: decisionColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                questionNum,
                style: const TextStyle(
                  // fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        // border: Border.all(width: 1, color: Colors.white),
                        ),
                    child: Expanded(
                      child: Text(
                        'Question: $qestion',
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    'Answer Clicked: $pickedAns',
                    style: const TextStyle(color: Colors.white),
                  ),
                  Text(
                    'Question Answer: $correctAns',
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
