import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:phone_auth_project/home_list.dart';
import 'package:phone_auth_project/login.dart';
import 'package:provider/provider.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

import './common/theme.dart';
import './models/eligibility.dart';

// import './components/video_full.dart';
// import './models/shared_preferences.dart';
// import './models/user.dart';

// import './form_builder/onboard_form.dart';
// import 'login.dart';
// import 'home_list.dart';

// OnboardingScreen
// import 'congrates.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(
    ChangeNotifierProvider(
      create: (context) => ExamEvaluateModal(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dashhire',
      theme: appTheme,
      home: AnimatedSplashScreen(
          duration: 1000,
          splash: Text(
            "Dashhire",
            style: TextStyle(
                color: Colors.white, fontSize: 35, fontWeight: FontWeight.bold),
          ),
          nextScreen: LoginScreen(),
          splashTransition: SplashTransition.fadeTransition,
          backgroundColor: Colors.deepPurpleAccent),
      // home: Congrates(),
      debugShowCheckedModeBanner: false,
    );
  }
}
