import 'package:adv_basics/data/questions.dart';
import 'package:flutter/material.dart';

import 'package:adv_basics/answer_button.dart';
import 'package:google_fonts/google_fonts.dart';

// 定義一個 StatefulWidget（可在生命週期內改變狀態）
class QuestionsScreen extends StatefulWidget {
  // 使用 const 關鍵字來創建一個不可變的 widget
  const QuestionsScreen({
    super.key,
    required this.onSelectAnswer,
  });

  final void Function(String answer) onSelectAnswer;

  // 覆寫 createState 方法來創建這個 widget 的狀態並返回一個新的 _QuestionsScreenState 實例
  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

// 定義 _QuestionsScreenState class，保存了 QuestionsScreen widget 的狀態
class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    // 調用 widget 的 onSelectAnswer 方法，並傳入選擇的答案
    widget.onSelectAnswer(selectedAnswer);

    setState(() {
      currentQuestionIndex++;
    });
  }

// 覆寫 build 方法來描述這個 widget 的 UI
  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];

    // 返回一個 SizedBox widget，這個 widget 可以強制其子 widget 有特定的寬度和高度
    return SizedBox(
      width: double.infinity, // 使 widget 的寬度盡可能大
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // 使子 widget 在主軸方向上居中
          crossAxisAlignment:
              CrossAxisAlignment.stretch, // 使子 widget 在交叉軸方向上填滿父 widget
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 238, 220, 255),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ...currentQuestion.getShuffledAnswers().map((answer) {
              return AnswerButton(
                answerText: answer,
                onPress: () {
                  answerQuestion(answer);
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}
