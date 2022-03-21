import 'package:flutter/material.dart';

class PreviousAssessment extends StatefulWidget {
  const PreviousAssessment({Key? key}) : super(key: key);

  @override
  State<PreviousAssessment> createState() => _PreviousAssessmentState();
}

class _PreviousAssessmentState extends State<PreviousAssessment> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        "Previous Assessment",
      ),
    );
  }
}
