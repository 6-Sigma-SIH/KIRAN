import 'package:kiran/kiran_app/kiran_app_theme.dart';
import 'package:flutter/material.dart';
import 'package:kiran/kiran_app/test/question_widget.dart';
import 'package:kiran/kiran_app/test/testOption_widget.dart';
import 'package:kiran/kiran_app/test/testTitle_widget.dart';

List<String> anxietyQuestions = <String>[
  'Feeling nervous, anxious or on edge',
  'Not being able to stop or control worrying',
  'Worrying too much about different things',
  'Trouble relaxing',
  'Being so restless that it is hard to sit still',
  'Becoming easily annoyed or irritable',
  'Feeling afraid as if something awful might happen'
];

List<String> anxietyOptions = <String>[
  'Not at all',
  'Several days',
  'More than half the days',
  'Nearly every day',
];

class AnxietyTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Expanded(
          //color: KiranAppTheme.background,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TestTitle(
                testTitle: 'Anxiety',
              ),
              QuestionText(
                questionText: anxietyQuestions[2],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      TestOptionButton(
                          optionText: "Strongly Disagree", score: 1),
                      TestOptionButton(optionText: "Disagree", score: 2),
                      TestOptionButton(optionText: "Neutral", score: 3),
                      TestOptionButton(optionText: "Agree", score: 4),
                      TestOptionButton(optionText: "Strongly Agree", score: 5),
                    ],
                  ),
                ],
              ),
              Container(
                alignment: Alignment.bottomRight,
                child: Column(
                  children: [
                    Divider(
                      thickness: 0.5,
                      color: KiranAppTheme.nearlyDarkBlue,
                    ),
                    Text(
                      "12/15",
                      style: KiranAppTheme.questions,
                      //textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
