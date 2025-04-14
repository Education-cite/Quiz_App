import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});
  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  @override
  Widget build(context) {
    final currentQuestions = questions[0];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              currentQuestions.questionText,
              style: TextStyle(fontSize: 24.0, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            ...currentQuestions.getShuffledAnswers().map((answer) {
              return AnswerButton(buttonText: answer, onTap: () {});
            }),

            // AnswerButton(buttonText: currentQuestions.answers[0], onTap: () {}),
            // AnswerButton(buttonText: currentQuestions.answers[1], onTap: () {}),
            // AnswerButton(buttonText: currentQuestions.answers[2], onTap: () {}),
            // AnswerButton(buttonText: currentQuestions.answers[3], onTap: () {}),
          ],
        ),
      ),
    );
  }
}
