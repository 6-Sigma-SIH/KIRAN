// ignore_for_file: prefer_const_constructors

import 'package:flutter/services.dart';
import 'package:kiran/kiran_app/kiran_app_theme.dart';
import 'package:flutter/material.dart';
import 'package:kiran/profile/profile_widget/numbers_widget.dart';
import 'package:kiran/profile/profile_widget/profile_widget.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("Profile page");
    return Container(
      child: Builder(
        builder: (context) => Scaffold(
          body: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              TextButton(
                onPressed: () {
                  print("EDIT Profile");
                  Navigator.pushNamed(context, '/editProfile');
                },
                child: Text("Edit Profile"),
              ),
              // ProfileWidget(
              //   onClicked: () {
              //     print("EDIT PRofile");
              //     Navigator.pushNamed(context, 'editProfile');
              //     // Navigator.of(context).push(
              //     //   MaterialPageRoute(builder: (context) => EditProfilePage()),
              //     // );
              //   },
              // ),
              const SizedBox(height: 24),
              buildName(),
              const SizedBox(height: 24),
              Center(
                child: Text("About Me"),
              ),
              const SizedBox(height: 24),
              NumbersWidget(),
              const SizedBox(height: 48),
              buildAbout(),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildName() => Column(
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        Text(
          "Manan Karani", //user.name,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        const SizedBox(height: 4),
        Text(
          "manankarani@gmail.com", //user.email,
          style: TextStyle(color: Colors.grey),
        )
      ],
    );

// Widget buildUpgradeButton() => ButtonWidget(
//       text: 'Upgrade To PRO',
//       onClicked: () {},
//     );

Widget buildAbout() => Container(
      padding: EdgeInsets.symmetric(horizontal: 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Text(
            'About',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Text(
            "About me", //user.about,
            style: TextStyle(fontSize: 16, height: 1.4),
          ),
        ],
      ),
    );
