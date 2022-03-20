// ignore_for_file: prefer_const_constructors
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:progress_state_button/iconed_button.dart';
import 'package:progress_state_button/progress_button.dart';
import 'package:kiran/profile/profile_widget/textfield_widget.dart';
import 'package:kiran/kiran_app/kiran_app_theme.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

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

    return Scaffold(
      backgroundColor: KiranAppTheme.background,
      body: SafeArea(
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
                Expanded(
                  child: Text(
                    'Edit Profile',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      fontFamily: KiranAppTheme.fontName,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: TextFieldWidget(
                        label: 'First Name',
                        text: '$firstName',
                        onChanged: (firstname) {},
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: TextFieldWidget(
                        label: 'Last Name',
                        text: '$lastName',
                        onChanged: (lastName) {},
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              padding: const EdgeInsets.all(5.0),
                              child: const Text(
                                "Gender",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                            ),
                          ),
                          DropdownButtonFormField2(
                            decoration: InputDecoration(
                              //Add isDense true and zero Padding.
                              //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
                              isDense: true,
                              contentPadding: EdgeInsets.zero,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              //Add more decoration as you want here
                              //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
                            ),
                            isExpanded: true,
                            hint: const Text(
                              'Gender',
                              style: TextStyle(fontSize: 14),
                            ),
                            icon: const Icon(
                              Icons.arrow_drop_down,
                              color: Colors.black45,
                            ),
                            iconSize: 30,
                            buttonHeight: 60,
                            buttonPadding:
                                const EdgeInsets.only(left: 20, right: 10),
                            dropdownDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            items: _genders
                                .map((item) => DropdownMenuItem<String>(
                                      value: item,
                                      child: Text(
                                        item,
                                        style: const TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ))
                                .toList(),
                            validator: (value) {
                              if (value == null) {
                                return 'Please select gender.';
                              }
                            },
                            onChanged: (value) {
                              //Do something when changing the item if you want.
                            },
                            onSaved: (value) {
                              _selectedGender = value.toString();
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: TextFieldWidget(
                        keyboardInputType: TextInputType.number,
                        label: 'Age',
                        text: '$age',
                        onChanged: (age) {},
                      ),
                    ),
                  ],
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
                        padding: EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 5.0),
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
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      buildTextWithIcon(),
                    ])
              ],
            ),
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
