// ignore_for_file: prefer_const_constructors
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:progress_state_button/iconed_button.dart';
import 'package:progress_state_button/progress_button.dart';
import 'package:kiran/profile/profile_widget/profile_widget.dart';
import 'package:kiran/profile/profile_widget/textfield_widget.dart';
import 'package:kiran/app_theme.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  ButtonState stateOnlyText = ButtonState.idle;

  ButtonState stateOnlyCustomIndicatorText = ButtonState.idle;

  ButtonState stateTextWithIcon = ButtonState.idle;

  ButtonState stateTextWithIconMinWidthState = ButtonState.idle;

  Widget buildTextWithIcon() {
    return ProgressButton.icon(iconedButtons: {
      ButtonState.idle: IconedButton(
          text: "Save Details",
          icon: Icon(Icons.save, color: Colors.white),
          color: Colors.deepPurple.shade500),
      ButtonState.loading:
          IconedButton(text: "Loading", color: Colors.deepPurple.shade700),
      ButtonState.fail: IconedButton(
          text: "Failed",
          icon: Icon(Icons.cancel, color: Colors.white),
          color: Colors.red.shade300),
      ButtonState.success: IconedButton(
          text: "Successfully Saved",
          icon: Icon(
            Icons.check_circle,
            color: Colors.white,
          ),
          color: Colors.green.shade400)
    }, onPressed: onPressedIconWithText, state: stateTextWithIcon);
  }

  @override
  Widget build(BuildContext context) {
    String firstName = "Manan";
    String lastName = "Kumar";
    int age = 20;
    var medicalDetails = "I have a heart problem";
    String gender = "Male";
    int phoneNo = 9876543210;
    String email = "manankaarani@gmail.com";
    final List<String> _genders = ['Male', 'Female', 'Other'];
    String? _selectedGender = 'Male';

    return SafeArea(
      child: Builder(
        builder: (context) => Scaffold(
          //appBar: buildAppBar(context),
          body: ListView(
            padding: EdgeInsets.all(32),
            physics: BouncingScrollPhysics(),
            children: [
              // ProfileWidget(
              //   isEdit: true,
              //   onClicked: () async {},
              // ),
              const SizedBox(height: 24),
              TextFieldWidget(
                label: 'First Name',
                text: '$firstName',
                onChanged: (firstname) {},
              ),
              const SizedBox(height: 24),
              TextFieldWidget(
                label: 'Last Name',
                text: '$lastName',
                onChanged: (lastName) {},
              ),
              const SizedBox(height: 24),

              DropdownButton(
                hint: const Text('Select Gender'), // Not necessary for Option 1
                value: _selectedGender,
                onChanged: (newValue) {
                  setState(() {
                    _selectedGender = newValue as String;
                  });
                },
                items: _genders.map((location) {
                  return DropdownMenuItem(
                    child: new Text(location),
                    value: location,
                  );
                }).toList(),
              ),
              const SizedBox(height: 24),
              TextFieldWidget(
                keyboardInputType: TextInputType.number,
                label: 'Age',
                text: '$age',
                onChanged: (age) {},
              ),

              const SizedBox(height: 24),
              TextFieldWidget(
                keyboardInputType: TextInputType.emailAddress,
                label: 'Email',
                text: '$email',
                onChanged: (email) {},
              ),
              const SizedBox(height: 24),
              TextFieldWidget(
                label: 'Phone Number',
                text: '$phoneNo',
                onChanged: (phoneno) {},
              ),
              const SizedBox(height: 24),
              TextFieldWidget(
                label: 'Medical Details',
                text: '$medicalDetails',
                maxLines: 5,
                onChanged: (medicalDetails) {},
              ),
              Container(
                height: 32,
              ),
              Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 20.0, horizontal: 5.0),
                      child: OutlinedButton.icon(
                        icon: Icon(Icons.cancel),
                        label: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 20.0, horizontal: 2.0),
                          child: Text(
                            'Close',
                            style: TextStyle(fontSize: 15),
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
                          print('Pressed');
                        },
                      ),
                    ),
                    buildTextWithIcon(),
                  ])
            ],
          ),
        ),
      ),
    );
  }

  void onPressedIconWithText() async {
    switch (stateTextWithIcon) {
      case ButtonState.idle:
        stateTextWithIcon = ButtonState.loading;
        Future.delayed(Duration(seconds: 1), () {
          setState(() {
            stateTextWithIcon = Random.secure().nextBool()
                ? ButtonState.success
                : ButtonState.fail;
          });
        });

        break;
      case ButtonState.loading:
        break;
      case ButtonState.success:
        stateTextWithIcon = ButtonState.idle;
        break;
      case ButtonState.fail:
        stateTextWithIcon = ButtonState.idle;
        break;
    }
    setState(() {
      stateTextWithIcon = stateTextWithIcon;
    });
  }
}
