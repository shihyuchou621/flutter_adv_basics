import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/questions_summary/questions_summary.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.chosenAnswers,
    required this.onRestart,
  });

  final List<String> chosenAnswers;
  final void Function() onRestart;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i],
      });
    }
    return summary;
  }

  // getter：直接定義summaryData
  // 外部使用此getter時，也一樣不需再加括號，直接使用summaryData即可

  //   List<Map<String, Object>> get summaryData {
  //   final List<Map<String, Object>> summary = [];

  //   for (var i = 0; i < chosenAnswers.length; i++) {
  //     summary.add({
  //       'question_index': i,
  //       'question': questions[i].text,
  //       'correct_answer': questions[i].answers[0],
  //       'user_answer': chosenAnswers[i],
  //     });
  //   }
  //   return summary;
  // }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData(); // 使用getter的話就不需這行，直接使用summaryData即可
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData
        .where(
          (data) => data['correct_answer'] == data['user_answer'],
        )
        .length;

    return SizedBox(
      width: double.infinity, // 使 widget 的寬度盡可能大
      child: Container(
          margin: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // 使子 widget 在主軸方向上居中
            children: [
              Text(
                'You answered $numCorrectQuestions out of $numTotalQuestions questions correctly!',
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 30),
              QuestionsSummary(summaryData),
              const SizedBox(height: 30),
              TextButton.icon(
                onPressed: onRestart,
                style: TextButton.styleFrom(foregroundColor: Colors.white),
                icon: const Icon(Icons.refresh),
                label: const Text('Restart Quiz'),
              )
            ],
          )),
    );
  }
}
