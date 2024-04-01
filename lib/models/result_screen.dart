import 'package:adv_basics/data/questions.dart';
import 'package:flutter/material.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.chosenAnswers,
  });

  final List<String> chosenAnswers;

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

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity, // 使 widget 的寬度盡可能大
      child: Container(
          margin: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // 使子 widget 在主軸方向上居中
            children: [
              const Text('You answered X out of Y questions correctly!'),
              const SizedBox(height: 30),
              const Text('List of answers and questions...'),
              const SizedBox(height: 30),
              TextButton(
                onPressed: () {},
                child: const Text('Restart Quiz'),
              )
            ],
          )),
    );
  }
}