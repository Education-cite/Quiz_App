import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/results_screen.dart';
import 'package:quiz_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  // Widget? activeScreen;
  List<String> selectedAnswers = [];

  var activeScreen = 'start-screen';

  /*
  @override
  void initState() {
    super.initState();
    activeScreen = StartScreen(swichScreen);
  }
*/

  void swichScreen() {
    setState(() {
      //  activeScreen = QuestionsScreen();
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String anawer) {
    selectedAnswers.add(anawer);
    if (selectedAnswers.length == questions.length) {
      selectedAnswers = [];
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    /*
    final activeSwitchScreen =
        activeScreen == 'startScreen'
            ? StartScreen(swichScreen)
            : QuestionsScreen();
            */
    Widget activeSwitchScreen = StartScreen(swichScreen);

    if (activeScreen == 'questions-screen') {
      activeSwitchScreen = QuestionsScreen(onSelectAnswer: chooseAnswer);
    }
    if (activeScreen == 'result-screen') {
      activeSwitchScreen = ResultsScreen(chosenAnswers: selectedAnswers);
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color.fromARGB(255, 67, 144, 177),
                const Color.fromARGB(255, 77, 213, 255),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          // child: activeScreen,
          child: activeSwitchScreen,

          /*
              activeScreen == 'startScreen'
                  ? StartScreen(swichScreen)
                  : QuestionsScreen(),
                  */
        ),
      ),
    );
  }
}
