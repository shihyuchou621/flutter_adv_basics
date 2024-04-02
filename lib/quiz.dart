import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/results_screen.dart';
import 'package:adv_basics/questions_screen.dart';
import 'package:adv_basics/start_screen.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  // createState 方法返回一個 State 物件，這個物件包含了 Quiz 的狀態
  State<Quiz> createState() {
    return _QuizState();
  }
}

// _QuizState 類別包含了 Quiz 的狀態
// 前方加底線表示這個類別是私有的，只能在這個檔案中使用
// 其他參數也可這樣命名，比方說下方的__selectedAnswers，加上底線其他檔案就無法使用
class _QuizState extends State<Quiz> {
  List<String> _selectedAnswers = [];
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

// 將選擇的答案添加到列表 _selectedAnswers 中
  void chooseAnswer(String answer) {
    _selectedAnswers.add(answer);

    if (_selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      _selectedAnswers = [];
      activeScreen = 'questions-screen';
    });
  }

  @override
  // build 方法返回一個 Widget，描述了 UI 應該如何顯示
  Widget build(context) {
    // 根據 activeScreen 的值，選擇要顯示的 Widget
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(
        onSelectAnswer: chooseAnswer,
      );
    }

    if (activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(
        chosenAnswers: _selectedAnswers,
        onRestart: restartQuiz,
      );
    }

    // MaterialApp 是一個應用程式的root Widget，它包含了一些共享的設定，如主題
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 46, 15, 100),
                Color.fromARGB(255, 139, 39, 176),
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
