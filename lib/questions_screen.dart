import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});
  final void Function(String answer) onSelectAnswer;
  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionsIndex = 0;
  void answerQuestion(String answers) {
    widget.onSelectAnswer(answers);
    setState(() {
      currentQuestionsIndex++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionsIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              currentQuestion.questionText,
              style: TextStyle(fontSize: 24.0, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            ...currentQuestion.getShuffledAnswers().map((answer) {
              return AnswerButton(
                buttonText: answer,
                onTap: () {
                  answerQuestion(answer);
                  // print(answer);
                },
              );
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
