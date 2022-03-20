// ignore_for_file: no_logic_in_create_state

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
        child: Expanded(
          //color: KiranAppTheme.background,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TestTitle(
                testTitle: "$assessmentTitle Diagnosis",
              ),
              Center(
                child: Container(
                  margin: const EdgeInsets.all(15.0),
                  padding: const EdgeInsets.all(3.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(color: KiranAppTheme.nearlyDarkBlue),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          "$diagnosisTitle",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        VerticalDivider(
                          color: KiranAppTheme.nearlyDarkBlue,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          "$diagnosisDescription",
                          style: TextStyle(
                            fontSize: 15.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
