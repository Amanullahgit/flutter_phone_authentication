import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:phone_auth_project/congrates.dart';
import 'package:phone_auth_project/form_builder/onboard_form.dart';

import 'package:phone_auth_project/home_list.dart';
import 'package:phone_auth_project/login.dart';
import 'package:provider/provider.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './common/theme.dart';
import './models/eligibility.dart';

import './company_code.dart';
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
  Future<String> userId;
  bool isLoggedIn;
  String mobile;

  Future<void> _userLoggedIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    isLoggedIn = (prefs.getBool('isLoggedIn') == null)
        ? false
        : prefs.getBool('isLoggedIn');

    mobile = prefs.getString("mobile");
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _userLoggedIn(), // function where you call your api
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            print(
                "IsLoggedIn+++ mobile+++++++++++++++++++++++++ $isLoggedIn $mobile");
            Widget firstWidget;

            // Assign widget based on availability of currentUser
            if (isLoggedIn != null && isLoggedIn == true) {
              // INFO: save user mobile to state from shared_pref
              Provider.of<ExamEvaluateModal>(context, listen: false)
                  .set_mobile(mobile);
              firstWidget = CompanyCodeScreen();
            } else {
              firstWidget = LoginScreen();
            }
            return MaterialApp(
              title: 'Dashhire',
              theme: appTheme,
              home: AnimatedSplashScreen(
                  duration: 1000,
                  splash: Text(
                    "Dashhire",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.bold),
                  ),
                  nextScreen: firstWidget,
                  splashTransition: SplashTransition.fadeTransition,
                  backgroundColor: Colors.deepPurpleAccent),
              // home: Congrates(),
              debugShowCheckedModeBanner: false,
              builder: EasyLoading.init(),
            );
          }
        });
  }
}
