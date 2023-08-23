import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summary/questions_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {required this.chosenAnswers, required this.onResetQuiz, super.key});

  final List<String> chosenAnswers;
  final void Function() onResetQuiz;

  List<Map<String, Object>> getSummaryData() {
    return List.generate(chosenAnswers.length, (index) {
      return {
        'question_index': index,
        'question_text': questions[index].text,
        'correct_answer': questions[index].answerText[0],
        'user_answer': chosenAnswers[index]
      };
    });
  }

  int getNumCorrectAnswers(List<Map<String, Object>> summaryData) {
    return summaryData
        .where((data) => data['user_answer'] == data['correct_answer'])
        .length;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = getNumCorrectAnswers(summaryData);
    // print(numCorrectQuestions);
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'You answered $numCorrectQuestions out of $numTotalQuestions questions correctly!',
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 169, 120, 238),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionSummary(summaryData),
            const SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: onResetQuiz,
              child: const Text('Restart Quiz!'),
            )
          ],
        ),
      ),
    );
  }
}
