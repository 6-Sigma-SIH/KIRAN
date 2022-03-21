import 'package:kiran/kiran_app/diagnosis/diagnosis.dart';
import 'package:kiran/kiran_app/diagnosis/diagnosis_brain.dart';
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

List<int> anxietyScore = <int>[
  0,
  1,
  2,
  3,
];

String anxietyResult = '';
String anxietyInterpretation = '';

class AnxietyTest extends StatefulWidget {
  @override
  State<AnxietyTest> createState() => _AnxietyTestState();
}

class _AnxietyTestState extends State<AnxietyTest> {
  int totalScore = 0;
  String currentQuestion = anxietyQuestions[0];
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
                testTitle: 'Anxiety Assessment',
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
                      for (int i = 0; i < anxietyOptions.length; i++)
                        TestOptionButton(
                          optionText: anxietyOptions[i],
                          score: anxietyScore[i],
                          onPressed: () {
                            totalScore += anxietyScore[i];

                            if (currentQuestionIndex ==
                                anxietyQuestions.length) {
                              DiagnosisBrain diagnosisBrain =
                                  DiagnosisBrain(totalScore: totalScore);
                              anxietyResult = diagnosisBrain.getAnxietyResult();
                              anxietyInterpretation =
                                  diagnosisBrain.getAnxietyInterpretation();
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DiagnosisScreen(
                                    assessmentTitle: 'Anxiety',
                                    assessmentScore: totalScore,
                                    diagnosisTitle: anxietyResult,
                                    diagnosisDescription: anxietyInterpretation,
                                  ),
                                ),
                              );
                            } else {
                              setState(() {
                                currentQuestion =
                                    anxietyQuestions[currentQuestionIndex];
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
                      "$currentQuestionIndex / ${anxietyQuestions.length}",
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
