import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import './common/theme.dart';

import 'login.dart';
// import './onboard/onboard_form.dart';
// import 'home.dart';
// import 'home_list.dart';

// OnboardingScreen
// import 'congrates.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MaterialApp(
    theme: appTheme,
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LoginScreen();
  }
}
