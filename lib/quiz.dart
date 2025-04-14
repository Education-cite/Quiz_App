import 'package:flutter/material.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  // Widget? activeScreen;
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
      activeSwitchScreen = QuestionsScreen();
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
