import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kiran/kiran_app/kiran_app_theme.dart';
import 'package:kiran/profile/profile_widget/profile_widget.dart';
import 'package:kiran/profile/profile_widget/textfield_widget.dart';
import 'package:progress_state_button/iconed_button.dart';
import 'package:progress_state_button/progress_button.dart';
import 'package:kiran/login_screen/api_response.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final String _baseUrl = "https://apiv2kiranapp.herokuapp.com/";
  final List<String> _genders = ['Male', 'Female', 'Other'];
  String? _selectedGender = 'Male';
  late String firstName = 'Name';
  late String lastName = 'Name';
  late String email = 'manankarani@gmail.com';
  late String password = 'manan';
  late String phone = '+917021956350';
  late String age = '18';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KiranAppTheme.background,
      body: SafeArea(
        child: Builder(
          builder: (context) => Scaffold(
            //appBar: buildAppBar(context),
            body: ListView(
              padding: const EdgeInsets.all(32),
              physics: const BouncingScrollPhysics(),
              children: [
                const Text('Register', style: TextStyle(fontSize: 24)),
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
                          onChanged: (name) {},
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: TextFieldWidget(
                          label: 'Last Name',
                          text: lastName,
                          onChanged: (name) {},
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                TextFieldWidget(
                  label: 'Email',
                  text: 'manankarani@gmail.com',
                  onChanged: (email) {},
                ),
                const SizedBox(height: 24),
                TextFieldWidget(
                  label: 'Phone Number',
                  text: phone,
                  onChanged: (email) {},
                ),
                const SizedBox(height: 24),
                SizedBox(
                  child: Row(
                    children: [
                      Expanded(
                        child: DropdownButton(
                          hint: const Text(
                              'Select Gender'), // Not necessary for Option 1
                          value: _selectedGender,
                          onChanged: (newValue) {
                            setState(() {
                              _selectedGender = newValue as String;
                            });
                          },
                          items: _genders.map((gender) {
                            return DropdownMenuItem(
                              child: Text(gender),
                              value: gender,
                            );
                          }).toList(),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: TextFieldWidget(
                          label: 'Age',
                          text: age,
                          onChanged: (name) {},
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                ProgressButton.icon(
                    iconedButtons: {
                      ButtonState.idle: IconedButton(
                          text: "Register",
                          icon: const Icon(Icons.done, color: Colors.white),
                          color: Colors.deepPurple.shade500),
                      ButtonState.loading: IconedButton(
                          text: "Loading", color: Colors.deepPurple.shade700),
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
                      ApiResponse _apiResponse = ApiResponse();

                      try {
                        final response = await http.post(
                            Uri.parse('${_baseUrl}v2/loginPatient'),
                            body: {
                              "firstName": firstName,
                              "gender": _selectedGender,
                              "password": password,
                              "email": email
                            });
                        if (response.statusCode == 200) {
                          _apiResponse.Data = response.body;
                        } else {
                          _apiResponse.ApiError = "Invalid Credentials";
                          return 'Invalid Credentials';
                        }
                        debugPrint(response.body);
                      } catch (e) {
                        return e.toString();
                      }
                    },
                    state: ButtonState.idle)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
