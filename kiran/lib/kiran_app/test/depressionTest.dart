import 'package:kiran/kiran_app/kiran_app_theme.dart';
import 'package:flutter/material.dart';
import 'package:kiran/kiran_app/test/question_widget.dart';
import 'package:kiran/kiran_app/test/testOption_widget.dart';
import 'package:kiran/kiran_app/test/testTitle_widget.dart';

List<String> depressionQuestions = <String>[
  'Little interest or pleasure in doing things',
  'Feeling down, depressed or hopeless',
  'Trouble falling asleep, staying asleep, or sleeping too much',
  'Feeling tired or having little energy',
  'Poor appetite or overeating',
  'Feeling bad about yourself - or that you’re a failure or have let yourself or your family down',
  'Trouble concentrating on things, such as reading the newspaper or watching television',
  'Moving or speaking so slowly that other people could have noticed. Or, the opposite - being so fidgety or restless that you have been moving around a lot more than usual',
  'Thoughts that you would be better off dead or of hurting yourself in some way'
];

List<String> depressionOptions = <String>[
  'Not at all',
  'Several days',
  'More than half the days',
  'Nearly every day'
];

List<int> depressionScore = <int>[
  0,
  1,
  2,
  3,
];

class DepressionScreen extends StatelessWidget {
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
                testTitle: 'ADHD',
              ),
              QuestionText(
                questionText: depressionQuestions[2],
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
