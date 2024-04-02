import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnswerButton extends StatelessWidget {
  // 非命名參數：使用時要按照順序指定參數值
  // const AnswerButton(this.answerText, this.onPress, {super.key});

  // 命名參數：使用時要指定參數名稱，順序不拘
  const AnswerButton({
    super.key,
    required this.answerText,
    required this.onPress,
  });

  final String answerText;
  final void Function() onPress;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 40,
        ),
        backgroundColor: const Color.fromARGB(255, 37, 17, 92),
        foregroundColor: Colors.white, // 字體顏色（會被下面的child中的style蓋過）
        // 讓按鈕變成圓角
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
      ),
      child: Text(
        answerText,
        textAlign: TextAlign.center,
        style: GoogleFonts.lato(
            color: const Color.fromARGB(255, 238, 220, 255),
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
