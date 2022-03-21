import 'package:flutter/material.dart';
import 'package:kiran/kiran_app/kiran_app_theme.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard(
      {required this.colour, required this.cardChild, required this.onPress});

  final Color colour;
  final Widget cardChild;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            color: colour,
            borderRadius: BorderRadius.circular(30.0),
            boxShadow: [
              BoxShadow(
                color: KiranAppTheme.nearlyDarkBlue,
                spreadRadius: 2.0,
              ),
            ]),
      ),
    );
  }
}
