// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:progress_state_button/iconed_button.dart';
import 'package:progress_state_button/progress_button.dart';
import 'package:kiran/profile/profile_widget/profile_widget.dart';
import 'package:kiran/profile/profile_widget/textfield_widget.dart';

class EditProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Builder(
        builder: (context) => Scaffold(
          //appBar: buildAppBar(context),
          body: ListView(
            padding: EdgeInsets.all(32),
            physics: BouncingScrollPhysics(),
            children: [
              ProfileWidget(
                isEdit: true,
                onClicked: () async {},
              ),
              const SizedBox(height: 24),
              TextFieldWidget(
                label: 'Full Name',
                text: 'Manan Karani',
                onChanged: (name) {},
              ),
              const SizedBox(height: 24),
              TextFieldWidget(
                label: 'Email',
                text: 'manankarani@gmail.com',
                onChanged: (email) {},
              ),
              const SizedBox(height: 24),
              TextFieldWidget(
                label: 'About',
                text: 'Information about me',
                maxLines: 5,
                onChanged: (about) {},
              ),
              ProgressButton.icon(
                  iconedButtons: {
                    ButtonState.idle: IconedButton(
                        text: "Send",
                        icon: Icon(Icons.send, color: Colors.white),
                        color: Colors.deepPurple.shade500),
                    ButtonState.loading: IconedButton(
                        text: "Loading", color: Colors.deepPurple.shade700),
                    ButtonState.fail: IconedButton(
                        text: "Failed",
                        icon: Icon(Icons.cancel, color: Colors.white),
                        color: Colors.red.shade300),
                    ButtonState.success: IconedButton(
                        text: "Success",
                        icon: Icon(
                          Icons.check_circle,
                          color: Colors.white,
                        ),
                        color: Colors.green.shade400)
                  },
                  onPressed: () {
                    print("Send");
                  },
                  state: ButtonState.idle)
            ],
          ),
        ),
      ),
    );
  }
}
