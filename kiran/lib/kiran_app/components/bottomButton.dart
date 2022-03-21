// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:kiran/kiran_app/kiran_app_theme.dart';
import '../constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({required this.onTap, required this.buttonTitle});
  final VoidCallback onTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            buttonTitle,
            style: TextStyle(
              fontSize: 25.0,
              color: Colors.white,
            ),
          ),
        ),
        color: KiranAppTheme.nearlyDarkBlue,
        margin: EdgeInsets.only(top: 10),
        // padding: EdgeInsets.only(bottom: 5.0),
        width: double.infinity,
        height: kBottomContainerHeight,
      ),
    );
  }
}
