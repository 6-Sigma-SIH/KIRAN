import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:kiran/kiran_app/kiran_app_home_screen.dart';
import 'package:kiran/login_screen/api_response.dart';
import 'package:http/http.dart' as http;
import 'package:kiran/kiran_app/kiran_app_theme.dart';
import 'package:kiran/login_screen/register_screen.dart';
import 'package:permission_handler/permission_handler.dart';

// const users = {
//   'dribbble@gmail.com': '12345',
//   'hunter@gmail.com': 'hunter',
// };
String _baseUrl = "https://apiv2kiranapp.herokuapp.com/";

class AppState extends StatefulWidget {
  @override
  AppPermission createState() => AppPermission();
}

class AppPermission extends State<AppState> {
  Future<void> requestStoragePermission() async {
    final serviceStatus = await Permission.storage.isGranted;

    bool isPermissionOn = serviceStatus == ServiceStatus.enabled;

    final status = await Permission.storage.request();

    if (status == PermissionStatus.granted) {
      print('Permission Granted');
    } else if (status == PermissionStatus.denied) {
      print('Permission denied');
    } else if (status == PermissionStatus.permanentlyDenied) {
      print('Permission Permanently Denied');
      await openAppSettings();
    }
  }

  Future<void> requestLocationPermission() async {
    final serviceStatusLocation = await Permission.locationWhenInUse.isGranted;

    bool isLocation = serviceStatusLocation == ServiceStatus.enabled;

    final status = await Permission.locationWhenInUse.request();

    if (status == PermissionStatus.granted) {
      print('Permission Granted');
    } else if (status == PermissionStatus.denied) {
      print('Permission denied');
    } else if (status == PermissionStatus.permanentlyDenied) {
      print('Permission Permanently Denied');
      await openAppSettings();
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw {requestLocationPermission(), requestStoragePermission()};
  }
}

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  Duration get loginTime => const Duration(milliseconds: 2250);
  bool pushRegisterScreen = false;
  Future<String?> _authUser(LoginData data) async {
    debugPrint('Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then(
      (_) async {
        ApiResponse _apiResponse = ApiResponse();

        try {
          final response = await http.post(
            Uri.parse('${_baseUrl}v2/loginPatient'),
            body: {
              'email': data.name,
              'password': data.password,
            },
          );
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
        return null;
      },
    );
  }

  Future<String?> _signupUser(SignupData data) async {
    debugPrint('Signup Name: ${data.name}, Password: ${data.password}');
    pushRegisterScreen = true;
    return Future.delayed(loginTime).then(
      (_) async {},
    );
  }

  Future<String> _recoverPassword(String name) {
    debugPrint('Name: $name');
    return Future.delayed(loginTime).then(
      (_) {
        // if (!users.containsKey(name)) {
        //   return 'User not exists';
        // }
        return 'mock_password';
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'KIRAN',
      // logo: AssetImage('assets/images/ecorp-lightblue.png'),
      onLogin: _authUser,
      onSignup: _signupUser,
      onSubmitAnimationCompleted: () {
        AppPermission().requestLocationPermission();
        AppPermission().requestStoragePermission();
        if (pushRegisterScreen) {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => RegisterScreen()));
        } else {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => const KiranAppHomeScreen()));
        }
      },
      onRecoverPassword: _recoverPassword,
      messages: LoginMessages(
        userHint: 'Email',
        passwordHint: 'Password',
        confirmPasswordHint: 'Confirm',
        loginButton: 'LOGIN',
        signupButton: 'REGISTER',
        forgotPasswordButton: 'Forgot Password?',
        recoverPasswordButton: 'SEND EMAIL',
        goBackButton: 'GO BACK',
        confirmPasswordError: 'Passwords don\'t match!',
        recoverPasswordDescription:
            'Enter your email to receive instructions on how to reset your password',
        recoverPasswordSuccess: 'Password rescued successfully',
      ),
      theme: LoginTheme(
        primaryColor: KiranAppTheme.nearlyDarkBlue,
        accentColor: KiranAppTheme.background,
        cardTheme: const CardTheme(
          color: KiranAppTheme.background,
        ),
      ),
    );
  }
}
