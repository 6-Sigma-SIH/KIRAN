import 'package:kiran/kiran_app/kiran_app_theme.dart';
import 'package:flutter/material.dart';

class DepressionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: KiranAppTheme.background,
          child: Text(
            'Test Screen 2',
            style: TextStyle(
              fontSize: 20,
              color: Colors.blue,
            ),
          ),
        ),
      ),
    );
  }
}
