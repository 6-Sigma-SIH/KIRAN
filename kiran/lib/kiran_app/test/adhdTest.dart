import 'package:flutter/material.dart';
import 'package:kiran/kiran_app/kiran_app_theme.dart';

class AdhdTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Text(
          'Test Screen 3',
          style: TextStyle(
            fontSize: 20,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}
