// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, unused_local_variable

import 'package:flutter/material.dart';
import 'package:kiran/kiran_app/kiran_app_theme.dart';
import 'package:kiran/kiran_app/models/tasks.dart';
import 'package:provider/provider.dart';
import 'package:kiran/kiran_app/models/task_data.dart';
import 'package:kiran/main.dart';

class ChangeLanguage extends StatefulWidget {
  @override
  State<ChangeLanguage> createState() => _ChangeLanguageState();
}

class _ChangeLanguageState extends State<ChangeLanguage> {
  String _groupValue = 'en';
  @override
  Widget build(BuildContext context) {
    String newTaskTitle = '';
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 40,
          vertical: 25,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Select Language',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 33.0,
                color: KiranAppTheme.nearlyDarkBlue,
              ),
            ),
            RadioListTile(
              value: 'en',
              groupValue: _groupValue,
              onChanged: (newValue) =>
                  setState(() => _groupValue = newValue.toString()),
              title: Text('English'),
            ),
            RadioListTile(
              value: 'mr',
              groupValue: _groupValue,
              onChanged: (newValue) =>
                  setState(() => _groupValue = newValue.toString()),
              title: Text('Marathi'),
            ),
            RadioListTile(
              value: 'hi',
              groupValue: _groupValue,
              onChanged: (newValue) =>
                  setState(() => _groupValue = newValue.toString()),
              title: Text('Hindi'),
            ),
            RadioListTile(
              value: 'gu',
              groupValue: _groupValue,
              onChanged: (newValue) =>
                  setState(() => _groupValue = newValue.toString()),
              title: Text('Gujarati'),
            ),
          ],
        ),
      ),
    );
  }
}
