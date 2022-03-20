import 'package:flutter/material.dart';
import 'package:kiran/kiran_app/kiran_app_theme.dart';
import 'package:kiran/kiran_app/test/question_widget.dart';
import 'package:kiran/kiran_app/test/testOption_widget.dart';
import 'package:kiran/kiran_app/test/testTitle_widget.dart';
import 'package:kiran/kiran_app/diagnosis/diagnosis.dart';

List<String> adhdQuestions = <String>[
  'How often do you have trouble wrapping up the final details of a project, once the challenging parts have been done?',
  'How often do you have difficulty getting things in order when you have to do a task that requires organization?',
  'How often do you have problems remembering appointments or obligations?',
  'When you have a task that requires a lot of thought, how often do you avoid or delay getting started?',
  'How often do you fidget or squirm with your hands or feet when you have to sit down for a long time?',
  'How often do you feel overly active and compelled to do things, like you were driven by a motor?',
  'How often do you make careless mistakes when you have to work on a boring or difficult project?',
  'How often do you have difficulty keeping your attention when you are doing boring or repetitive work?',
  'How often do you have difficulty concentrating on what people say to you, even when they are speaking to you directly?',
  'How often do you misplace or have difficulty finding things at home or at work?',
  'How often are you distracted by activity or noise around you?',
  'How often do you leave your seat in meetings or other situations in which you are expected to remain seated?',
  'How often do you feel restless or fidgety?',
  'How often do you have difficulty unwinding and relaxing when you have time to yourself?',
  'How often do you find yourself talking too much when you are in social situations?',
  'When you’re in a conversation, how often do you find yourself finishing the sentences of the people you are talking to, before they can finish them themselves?',
  'How often do you have difficulty waiting your turn in situations when turn taking is required?',
  'How often do you interrupt others when they are busy?',
];

List<String> adhdOptions = <String>[
  'Never',
  'Rarely',
  'Sometimes',
  'Often',
  'Very Often',
];

List<int> adhdScore = <int>[
  0,
  1,
  2,
  3,
  4,
];

class AdhdTest extends StatefulWidget {
  @override
  State<AdhdTest> createState() => _AdhdTestState();
}

class _AdhdTestState extends State<AdhdTest> {
  @override
  int totalScore = 0;

  String currentQuestion = adhdQuestions[0];
  int currentQuestionIndex = 1;

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
                testTitle: 'ADHD Assessment',
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
                      for (int i = 0; i < adhdOptions.length; i++)
                        TestOptionButton(
                          optionText: adhdOptions[i],
                          score: adhdScore[i],
                          onPressed: () {
                            if (currentQuestionIndex == adhdQuestions.length) {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DiagnosisScreen(
                                            assessmentTitle: 'ADHD',
                                            assessmentScore: totalScore,
                                            diagnosisTitle: 'ADHD',
                                            diagnosisDescription: '',
                                          )));
                            } else {
                              totalScore += adhdScore[i];
                              setState(() {
                                currentQuestion = adhdQuestions[i + 1];
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
                      "$currentQuestionIndex / ${adhdQuestions.length}",
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
