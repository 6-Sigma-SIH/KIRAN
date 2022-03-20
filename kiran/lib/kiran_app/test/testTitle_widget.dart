import 'package:flutter/material.dart';
import 'package:kiran/kiran_app/kiran_app_theme.dart';

class TestTitle extends StatelessWidget {
  final String testTitle;
  const TestTitle({
    Key? key,
    required this.testTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          '$testTitle Assessment',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        Divider(
          thickness: 0.5,
          color: KiranAppTheme.nearlyDarkBlue,
        ),
      ],
    );
  }
}
