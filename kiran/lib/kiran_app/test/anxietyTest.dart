import 'package:kiran/kiran_app/kiran_app_theme.dart';
import 'package:flutter/material.dart';

class AnxietyTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Text(
          'Test Screen 2',
          style: TextStyle(
            fontSize: 20,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}
