import 'dart:io';
import 'package:kiran/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:kiran/kiran_app/calendar/calendar.dart';
import 'package:kiran/kiran_app/kiran_app_home_screen.dart';
import 'package:kiran/kiran_app/test/adhdTest.dart';
import 'package:kiran/kiran_app/test/depressionTest.dart';
import 'package:kiran/login_screen/login_screen.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:kiran/login_screen/login_screen.dart';
import 'package:kiran/kiran_app/test/anxietyTest.dart';
import 'package:kiran/kiran_app/screens/task_screen.dart';
import 'package:kiran/profile/profile_edit_page.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:kiran/kiran_app/chat/chat.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Future.wait([
    SystemChrome.setPreferredOrientations(<DeviceOrientation>[
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]),
    initializeDateFormatting()
  ]).then((_) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness:
            !kIsWeb && Platform.isAndroid ? Brightness.dark : Brightness.light,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarDividerColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
    return MaterialApp(
      title: 'Kiran App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: AppTheme.textTheme,
        platform: TargetPlatform.iOS,
      ),
      initialRoute: '/login',
      routes: {
        '/': (context) => KiranAppHomeScreen(),
        '/login': (context) => LoginScreen(),
        '/calendar': (context) => Calendar(),
        '/anxiety': (context) => AnxietyTest(),
        '/depression': (context) => DepressionScreen(),
        '/adhd': (context) => AdhdTest(),
        '/chat': (context) => Chat(),
        '/notes': (context) => Notes(),
        '/editProfile': (context) => EditProfileScreen(),
      },
    );
  }
}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}
