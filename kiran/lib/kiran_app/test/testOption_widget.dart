import 'package:flutter/material.dart';
import 'package:kiran/kiran_app/kiran_app_theme.dart';

class TestOptionButton extends StatelessWidget {
  const TestOptionButton({
    Key? key,
    required this.optionText,
    this.score,
  }) : super(key: key);
  final String? optionText;
  final int? score;

  @override
  Widget build(BuildContext context) {
    return Center(
      // padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 5.0),

      child: Container(
        margin: const EdgeInsets.all(4),
        width: 250,
        height: 52,
        child: OutlinedButton(
          //icon: Icon(Icons.exposure_zero),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              '$optionText',
              style: TextStyle(fontSize: 17),
            ),
          ),
          style: OutlinedButton.styleFrom(
            primary: Colors.black,
            backgroundColor: Colors.white,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(30.0),
              ),
            ),
          ),
          onPressed: () {
            // add the points to the final score
          },
        ),
      ),
    );
  }
}
