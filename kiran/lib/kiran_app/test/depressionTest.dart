import 'package:kiran/kiran_app/diagnosis/diagnosis.dart';
import 'package:kiran/kiran_app/kiran_app_theme.dart';
import 'package:flutter/material.dart';
import 'package:kiran/kiran_app/test/question_widget.dart';
import 'package:kiran/kiran_app/test/testOption_widget.dart';
import 'package:kiran/kiran_app/test/testTitle_widget.dart';
import 'package:kiran/kiran_app/diagnosis/diagnosis_brain.dart';

List<String> depressionQuestions = <String>[
  'Little interest or pleasure in doing things',
  'Feeling down, depressed or hopeless',
  'Trouble falling asleep, staying asleep, or sleeping too much',
  'Feeling tired or having little energy',
  'Poor appetite or overeating',
  'Feeling bad about yourself - or that you\'re a failure or have let yourself or your family down',
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

String depressionResult = '';
String depressionInterpretation = '';

class DepressionScreen extends StatefulWidget {
  @override
  State<DepressionScreen> createState() => _DepressionScreenState();
}

class _DepressionScreenState extends State<DepressionScreen> {
  int totalScore = 0;

  String currentQuestion = depressionQuestions[0];

  int currentQuestionIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Expanded(
          //color: KiranAppTheme.background,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // ignore: prefer_const_constructors
              TestTitle(
                testTitle: 'Derpression',
              ),
              QuestionText(
                questionText: currentQuestion,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: <Widget>[
                      for (int i = 0; i < depressionOptions.length; i++)
                        TestOptionButton(
                          optionText: depressionOptions[i],
                          score: depressionScore[i],
                          onPressed: () {
                            totalScore += depressionScore[i];

                            if (currentQuestionIndex ==
                                depressionQuestions.length) {
                              DiagnosisBrain diagnosisBrain =
                                  DiagnosisBrain(totalScore: totalScore);
                              depressionResult =
                                  diagnosisBrain.getDepressionResult();
                              depressionInterpretation =
                                  diagnosisBrain.getDepressionInterpretation();
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DiagnosisScreen(
                                            assessmentTitle: 'Depression',
                                            assessmentScore: totalScore,
                                            diagnosisTitle: depressionResult,
                                            diagnosisDescription:
                                                depressionInterpretation,
                                          )));
                            } else {
                              setState(() {
                                currentQuestion =
                                    depressionQuestions[currentQuestionIndex];
                                currentQuestionIndex++;
                              });
                            }
                          },
                        ),
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
                      "$currentQuestionIndex / ${depressionQuestions.length}",
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
