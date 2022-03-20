import 'package:flutter/material.dart';
import 'package:kiran/kiran_app/kiran_app_theme.dart';
import 'package:kiran/kiran_app/test/adhdTest.dart';

class QuestionText extends StatelessWidget {
  final String questionText;
  const QuestionText({
    Key? key,
    required this.questionText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: Text(
          questionText,
          style: KiranAppTheme.questions,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
