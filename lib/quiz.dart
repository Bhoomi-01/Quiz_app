import 'package:flutter/material.dart';
import 'package:quiz_app/home.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  //Widget? activeScreen;
  List<String> selectedAnswers = [];

  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      //activeScreen = const QuestionScreen1();
      activeScreen = 'Question-screen1';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        //selectedAnswers = [];
        activeScreen = 'results-screen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'Question-screen1';
    });
  }

  @override
  Widget build(context) {
    // final screenWidget = activeScreen == 'start-screen'
    //     ? HomeScreen(switchScreen)
    //     : const QuestionScreen1();

    Widget screenWidget = HomeScreen(switchScreen);

    if (activeScreen == 'Question-screen1') {
      screenWidget = QuestionScreen1(onSelectAnswer: chooseAnswer);
    }

    if (activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(
        chosenAnswers: selectedAnswers,
        onRestart: restartQuiz,
      );
    }

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.orange,
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(165, 216, 127, 10),
                Color.fromARGB(255, 199, 60, 18)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
