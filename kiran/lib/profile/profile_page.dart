// ignore_for_file: prefer_const_constructors

import 'package:draggable_fab/draggable_fab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:kiran/kiran_app/kiran_app_home_screen.dart';
import 'package:kiran/kiran_app/kiran_app_theme.dart';
import 'package:flutter/material.dart';
import 'package:kiran/profile/language_change.dart';
import 'package:kiran/login_screen/login_screen.dart';
import 'package:kiran/profile/profile_widget/numbers_widget.dart';
import 'package:kiran/profile/profile_widget/profile_widget.dart';
import 'package:kiran/kiran_app/contact/contact_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

String firstName = "Manan";
String lastName = "Kumar";
int age = 20;
var medicalDetails = "I have performance anxiety disorder";
String gender = "Male";
int phoneNo = 9876543210;
String email = "manankaarani@gmail.com";
final List<String> _genders = ['Male', 'Female', 'Other'];
String? _selectedGender = 'Male';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("Profile page");
    return Container(
      child: Builder(
        builder: (context) => Scaffold(
          floatingActionButton: DraggableFab(
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: 70,
              ),
              child: FloatingActionButton(
                heroTag: 'lang',
                backgroundColor: KiranAppTheme.nearlyDarkBlue,
                child: Icon(Icons.translate),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) => ChangeLanguage(),
                  );
                },
              ),
            ),
          ),
          body: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(
                    32, 32, 32, 1), //const EdgeInsets.all(32.0),
                child: Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'My Profile',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 16),
                      FloatingActionButton(
                        heroTag: 'editProfile',
                        onPressed: () {
                          print('Edit profile');
                          Navigator.pushNamed(context, '/editProfile');
                        },
                        child: Icon(Icons.edit),
                        backgroundColor: Color(0xff3D50D0),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(32, 2, 32, 2),
                child:
                    Divider(thickness: 1, color: KiranAppTheme.nearlyDarkBlue),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(32, 8, 32, 1),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Text(
                      "Name", //user.email,
                      style: TextStyle(color: KiranAppTheme.nearlyDarkBlue),
                    ),
                    Text(
                      "$firstName $lastName", //user.name,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Padding(
                padding: EdgeInsets.fromLTRB(
                    32, 1, 32, 1), //const EdgeInsets.all(32.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Phone Number", //user.email,
                      style: TextStyle(color: KiranAppTheme.nearlyDarkBlue),
                    ),
                    Text(
                      "$phoneNo",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Padding(
                padding: EdgeInsets.fromLTRB(
                    32, 1, 32, 1), //const EdgeInsets.all(32.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Email", //user.email,
                      style: TextStyle(color: KiranAppTheme.nearlyDarkBlue),
                    ),
                    Text(
                      "$email",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Padding(
                  padding: EdgeInsets.fromLTRB(
                      32, 1, 170, 1), //const EdgeInsets.all(32.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Age", //user.email,

                            style:
                                TextStyle(color: KiranAppTheme.nearlyDarkBlue),
                          ),
                          Text(
                            "$age Years",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Gender", //user.email,
                            style:
                                TextStyle(color: KiranAppTheme.nearlyDarkBlue),
                          ),
                          Text(
                            "$gender",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ],
                      ),
                    ],
                  )),
              //NumbersWidget(),
              const SizedBox(height: 24),
              Container(
                padding: EdgeInsets.fromLTRB(32, 8, 32, 1),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Text(
                      'Medical Details',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Divider(
                      thickness: 1,
                      color: KiranAppTheme.nearlyDarkBlue,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "$medicalDetails", //user.about,
                      style: TextStyle(fontSize: 16, height: 1.4),
                    ),
                    const SizedBox(height: 50),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: 48,
                          child: OutlinedButton.icon(
                            icon: Icon(
                              Icons.logout,
                              color: KiranAppTheme.nearlyWhite,
                            ),
                            label: Text(
                              'Logout',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: KiranAppTheme.nearlyWhite),
                            ),
                            style: OutlinedButton.styleFrom(
                              primary: KiranAppTheme.nearlyDarkBlue,
                              backgroundColor: KiranAppTheme.nearlyDarkBlue,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                              ),
                            ),
                            onPressed: () async {
                              SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              await prefs.clear();
                              debugPrint('logout aaaaaaaaaaaaaa');
                              bool? a = prefs.getBool('KiranisLoggedIn');
                              debugPrint(a.toString());
                              Navigator.pushNamedAndRemoveUntil(context,
                                  '/login', (Route<dynamic> route) => false);
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
