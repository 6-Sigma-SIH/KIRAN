import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kiran/kiran_app/kiran_app_theme.dart';
import 'package:kiran/profile/profile_widget/profile_widget.dart';
import 'package:kiran/profile/profile_widget/textfield_widget.dart';
import 'package:progress_state_button/iconed_button.dart';
import 'package:progress_state_button/progress_button.dart';
import 'package:kiran/login_screen/api_response.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterScreen extends StatefulWidget {
  var data;

  RegisterScreen({Key? key, required this.data}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState(data: data);
}

class _RegisterScreenState extends State<RegisterScreen> {
  _RegisterScreenState({this.data});
  var data;

  final String _baseUrl = "https://apiv2kiranapp.herokuapp.com/";
  final List<String> _genders = ['Male', 'Female', 'Other'];
  String? _selectedGender = '';
  String firstName = '';
  String lastName = '';
  String phone = '';
  String age = '';
  late String email = data.name;
  late String password = data.password;
  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KiranAppTheme.background,
      body: SafeArea(
        child: ModalProgressHUD(
          inAsyncCall: showSpinner,
          //appBar: buildAppBar(context),
          child: ListView(
            padding: const EdgeInsets.all(32),
            physics: const BouncingScrollPhysics(),
            children: [
              const Expanded(
                child: Text(
                  'Register',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              ProfileWidget(
                isEdit: true,
                onClicked: () async {},
              ),
              const SizedBox(height: 24),
              SizedBox(
                child: Row(
                  children: [
                    Expanded(
                      child: TextFieldWidget(
                        label: 'First Name',
                        text: firstName,
                        onChanged: (firstName) {
                          setState(() {
                            this.firstName = firstName;
                          });
                        },
                      ),
                    ),
                    const SizedBox(width: 4),
                    Expanded(
                      child: TextFieldWidget(
                        label: 'Last Name',
                        text: lastName,
                        onChanged: (lastName) {
                          setState(() {
                            this.lastName = lastName;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              TextFieldWidget(
                label: 'Email',
                text: email,
                onChanged: (email) {
                  setState(() {
                    this.email = email;
                  });
                },
              ),
              const SizedBox(height: 24),
              TextFieldWidget(
                keyboardInputType: TextInputType.number,
                label: 'Phone Number',
                text: phone,
                onChanged: (phone) {
                  setState(() {
                    this.phone = phone;
                  });
                },
              ),
              const SizedBox(height: 24),
              SizedBox(
                child: Row(
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
                            isExpanded: false,
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
                              setState(() {
                                _selectedGender = value.toString();
                              });
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
                        text: age,
                        onChanged: (age) {
                          setState(() {
                            this.age = age;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              ProgressButton.icon(
                iconedButtons: {
                  ButtonState.idle: const IconedButton(
                    text: "Register",
                    icon: Icon(Icons.done, color: Colors.white),
                    color: KiranAppTheme.nearlyDarkBlue,
                  ),
                  ButtonState.loading: const IconedButton(
                      text: "Loading", color: KiranAppTheme.nearlyBlue),
                  ButtonState.fail: IconedButton(
                      text: "Failed",
                      icon: const Icon(Icons.cancel, color: Colors.white),
                      color: Colors.red.shade300),
                  ButtonState.success: IconedButton(
                      text: "Success",
                      icon: const Icon(
                        Icons.check_circle,
                        color: Colors.white,
                      ),
                      color: Colors.green.shade400)
                },
                onPressed: () async {
                  setState(() {
                    showSpinner = true;
                  });
                  print("Here");
                  ApiResponse _apiResponse = ApiResponse();

                  try {
                    final data = {
                      "firstName": firstName,
                      "lastName": lastName,
                      "age": age,
                      "gender": _selectedGender,
                      "password": password,
                      "phoneNo": phone,
                      "email": email,
                    };
                    debugPrint(data.toString());
                    final response = await http.post(
                        Uri.parse('${_baseUrl}v2/registerPatient'),
                        body: data);
                    if (response.statusCode == 200) {
                      _apiResponse.Data = response.body;
                      debugPrint(response.body);
                      Navigator.of(context).popAndPushNamed('/');
                      setState(() {
                        showSpinner = false;
                      });
                    } else {
                      _apiResponse.ApiError = "Invalid Credentials";
                      debugPrint(response.body);
                      setState(() {
                        showSpinner = false;
                      });
                      return 'Invalid Credentials';
                    }
                    debugPrint(response.body);
                  } catch (e) {
                    debugPrint(e.toString());
                    return e.toString();
                  }
                },
                state: ButtonState.idle,
              )
            ],
          ),
        ),
      ),
    );
  }
}
