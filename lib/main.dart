import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:phone_auth_project/home_list.dart';
import 'package:provider/provider.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

import './common/theme.dart';
import './models/eligibility.dart';

// import 'login.dart';
// import './onboard/onboard_form.dart';
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
      // home: HomeScreen(),
      home: AnimatedSplashScreen(
          duration: 3000,
          splash: Icons.home,
          nextScreen: HomeScreen(),
          splashTransition: SplashTransition.fadeTransition,
          backgroundColor: Colors.deepPurpleAccent),
      debugShowCheckedModeBanner: false,
    );
  }
}
