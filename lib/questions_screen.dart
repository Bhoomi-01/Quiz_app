import 'package:flutter/material.dart';
import 'package:quiz_app/answers_button.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen1 extends StatefulWidget {
  const QuestionScreen1({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionScreen1> createState() {
    return _QuestionsScreen1();
  }
}

class _QuestionsScreen1 extends State<QuestionScreen1> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    //currentQuestionIndex = currentQuestionIndex + 1;
    //currentQuestionIndex += 1;
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(45),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.question,
              style: GoogleFonts.ubuntu(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            ...currentQuestion.getShuffledAnswers().map((ans) {
              return AnswersButton(
                  answertext: ans,
                  onTap: () {
                    answerQuestion(ans);
                  });
            }),
            // AnswersButton(answertext: currentQuestion.answers[0], onTap: () {}),
            // AnswersButton(answertext: currentQuestion.answers[1], onTap: () {}),
            // AnswersButton(answertext: currentQuestion.answers[2], onTap: () {}),
            // AnswersButton(answertext: currentQuestion.answers[3], onTap: () {}),
          ],
        ),
      ),
    );
  }
}
