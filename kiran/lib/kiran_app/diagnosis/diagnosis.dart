// ignore_for_file: no_logic_in_create_state

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kiran/kiran_app/components/bottomButton.dart';
import 'package:kiran/kiran_app/components/reusableCard.dart';
import 'package:kiran/kiran_app/constants.dart';
import 'package:url_launcher/url_launcher.dart';

import '../kiran_app_theme.dart';
import '../test/testTitle_widget.dart';

class DiagnosisScreen extends StatefulWidget {
  String assessmentTitle;
  int assessmentScore;
  String diagnosisTitle;
  String? diagnosisDescription;

  DiagnosisScreen({
    Key? key,
    required this.assessmentTitle,
    required this.assessmentScore,
    required this.diagnosisTitle,
    this.diagnosisDescription,
  }) : super(key: key);

  @override
  State<DiagnosisScreen> createState() => _DiagnosisScreenState(
        assessmentTitle: assessmentTitle,
        assessmentScore: assessmentScore,
        diagnosisTitle: diagnosisTitle,
        diagnosisDescription: diagnosisDescription,
      );
}

class _DiagnosisScreenState extends State<DiagnosisScreen> {
  final String assessmentTitle;
  final int assessmentScore;
  final String diagnosisTitle;
  final String? diagnosisDescription;

  _DiagnosisScreenState({
    required this.assessmentTitle,
    required this.assessmentScore,
    required this.diagnosisTitle,
    this.diagnosisDescription,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KiranAppTheme.background,
      body: SafeArea(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Center(
              child: Expanded(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10.0),
                      alignment: Alignment.bottomLeft,
                      child: Column(
                        children: [
                          Center(
                            child: Text(
                              '$assessmentTitle Diagnosis',
                              style: TextStyle(
                                fontSize: 30.0,
                              ),
                            ),
                          ),
                          Divider(
                            thickness: 0.5,
                            color: KiranAppTheme.nearlyDarkBlue,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Your Score",
              style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.normal,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              flex: 5,
              child: SingleChildScrollView(
                child: ReusableCard(
                  colour: Colors.white,
                  cardChild: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 36.0, left: 12.0, right: 12.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '$assessmentScore',
                                  style: TextStyle(
                                    fontSize: 60.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Indicates',
                                  style: TextStyle(
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 5, left: 12.0, right: 12.0),
                        child: Column(
                          children: <Widget>[
                            Text(
                              '$diagnosisTitle',
                              style: TextStyle(
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold,
                                color: KiranAppTheme.nearlyDarkBlue,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Divider(
                              indent: 17,
                              endIndent: 17,
                              thickness: 0.5,
                              color: KiranAppTheme.nearlyDarkBlue,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 36.0, left: 12.0, right: 12.0),
                        child: Text(
                          '$diagnosisDescription',
                          style: TextStyle(
                            fontSize: 15.0,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 5.0, left: 12.0, right: 12.0),
                        child: Column(
                          children: [
                            Text(
                              'What to do next?',
                              style: TextStyle(
                                fontSize: 25.0,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Divider(
                              indent: 15,
                              endIndent: 15,
                              thickness: 0.5,
                              color: KiranAppTheme.nearlyDarkBlue,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 36.0, left: 12.0, right: 12.0),
                        child: Text(
                          'Here are Some General Tips for managing $assessmentTitle : Take a time-out. Eat well-balanced meals. Get enough sleep.Exercise daily to help you feel good and maintain your health. Take deep breaths. Count to 10 slowly. ',
                          style: TextStyle(
                            fontSize: 15.0,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 5.0, left: 12.0, right: 12.0),
                        child: Column(
                          children: [
                            Text(
                              'What to do next?',
                              style: TextStyle(
                                fontSize: 25.0,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Divider(
                              indent: 15,
                              endIndent: 15,
                              thickness: 0.5,
                              color: KiranAppTheme.nearlyDarkBlue,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 5.0, left: 12.0, right: 12.0),
                        child: Text(
                          'You can click on the button below to schedule and appointment with our professionals. Meanwhile here are some links to help you get familiar with the condition:-',
                          style: TextStyle(
                            fontSize: 15.0,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 10.0, left: 12.0, right: 12.0),
                        child: InkWell(
                          onTap: () {
                            launch(
                                'https://www.who.int/news-room/fact-sheets/detail/mental-health-strengthening-our-response#:~:text=Mental%20health%20is%20a%20state,to%20his%20or%20her%20community.');
                          },
                          child: Text(
                            'World Health Organization',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Color.fromARGB(255, 0, 133, 221),
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 10.0, left: 12.0, right: 12.0),
                        child: InkWell(
                          onTap: () {
                            launch(
                                'https://www.medicalnewstoday.com/articles/154543');
                          },
                          child: Text(
                            'Medical News Today',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Color.fromARGB(255, 0, 133, 221),
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                    ],
                  ),
                  onPress: () {},
                ),
              ),
            ),
            BottomButton(
              buttonTitle: 'Schedule Appointment',
              onTap: () {
                Navigator.pushNamed(context, '/calendar');
              },
            ),
          ],
        ),
      ),
    );
  }
}
