import 'package:adv_basics/data/questions.dart';
import 'package:flutter/material.dart';

import 'package:adv_basics/models/answer_button.dart';

// 定義一個 StatefulWidget（可在生命週期內改變狀態）
class QuestionsScreen extends StatefulWidget {
  // 使用 const 關鍵字來創建一個不可變的 widget
  const QuestionsScreen({super.key});

  // 覆寫 createState 方法來創建這個 widget 的狀態並返回一個新的 _QuestionsScreenState 實例
  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

// 定義 _QuestionsScreenState 類，這個類保存了 QuestionsScreen widget 的狀態
class _QuestionsScreenState extends State<QuestionsScreen> {
  // 覆寫 build 方法來描述這個 widget 的 UI

  var currentQuestionIndex = 0;

  void answerQuestion() {
    setState(() {
      currentQuestionIndex++;
    });
  }

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
              style: const TextStyle(
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ...currentQuestion.getShuffledAnswers().map((answer) {
              return AnswerButton(
                answerText: answer,
                onPress: answerQuestion,
              );
            }),
          ],
        ),
      ),
    );
  }
}
