// ignore_for_file: no_logic_in_create_state

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kiran/kiran_app/components/bottomButton.dart';
import 'package:kiran/kiran_app/components/reusableCard.dart';
import 'package:kiran/kiran_app/constants.dart';

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
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Center(
              child: Expanded(
                child: Column(
                  children: [
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      padding: EdgeInsets.all(16.0),
                      alignment: Alignment.bottomLeft,
                      child: Center(
                        child: Text(
                          '$assessmentTitle',
                          style: TextStyle(
                            fontSize: 36.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: ReusableCard(
                colour: KiranAppTheme.background,
                cardChild: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 36.0, left: 12.0, right: 12.0),
                      child: Text(
                        '$diagnosisTitle',
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 36.0, left: 12.0, right: 12.0),
                      child: Text(
                        '$assessmentScore',
                        style: TextStyle(
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                      child: Text(
                        '$diagnosisDescription',
                        style: TextStyle(
                          fontSize: 24.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                onPress: () {},
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
