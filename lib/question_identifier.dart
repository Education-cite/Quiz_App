import 'package:flutter/material.dart';

class QuestionIdentifier extends StatelessWidget {
  const QuestionIdentifier({
    super.key,
    required this.isCorrectAnswer,
    required this.questionNumber,
  });
  final bool isCorrectAnswer;
  final int questionNumber;
  @override
  Widget build(BuildContext context) {
    final number = questionNumber + 1;
    return Container(
      width: 30,
      height: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isCorrectAnswer ? Colors.green : Colors.red,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Text(
        number.toString(),

        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: const Color.fromARGB(255, 235, 235, 233),
        ),
      ),
    );
  }
}
