import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:phone_auth_project/home_list.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:timer_button/timer_button.dart';
import 'package:provider/provider.dart';

import './../models/eligibility.dart';
import './company_code.dart';
import './utils/supabase_service.dart';

class OTPScreen extends StatefulWidget {
  final String phone;
  OTPScreen(this.phone);
  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  // User related
  String uid;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  String _verificationCode;
  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();
  final BoxDecoration pinPutDecoration = BoxDecoration(
    color: const Color.fromRGBO(43, 46, 66, 1),
    borderRadius: BorderRadius.circular(10.0),
    border: Border.all(
      color: const Color.fromRGBO(126, 203, 224, 1),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 40),
            child: Center(
              child: Text(
                'OTP sent to +91-${widget.phone}',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: PinPut(
              fieldsCount: 6,
              textStyle: const TextStyle(fontSize: 25.0, color: Colors.white),
              eachFieldWidth: 40.0,
              eachFieldHeight: 55.0,
              focusNode: _pinPutFocusNode,
              controller: _pinPutController,
              submittedFieldDecoration: pinPutDecoration,
              selectedFieldDecoration: pinPutDecoration,
              followingFieldDecoration: pinPutDecoration,
              pinAnimationType: PinAnimationType.fade,
              onSubmit: (pin) async {
                try {
                  await FirebaseAuth.instance
                      .signInWithCredential(PhoneAuthProvider.credential(
                          verificationId: _verificationCode, smsCode: pin))
                      .then((value) async {
                    if (value.user != null) {
                      _actionOnUserPresent(context);
                    }
                  });
                } catch (e) {
                  FocusScope.of(context).unfocus();
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('invalid OTP')));

                  // depricated
                  // _scaffoldkey.currentState
                  //     .showSnackBar(SnackBar(content: Text('invalid OTP')));
                }
              },
            ),
          ),
          SizedBox(
            height: 60,
          ),
          // new TimerButton(
          //   label: "Resend OTP",
          //   timeOutInSeconds: 50,
          //   onPressed: () {
          //     _verifyPhone();
          //   },
          //   disabledColor: Colors.grey,
          //   color: Colors.deepPurple[400],
          //   buttonType: ButtonType.OutlinedButton,
          //   disabledTextStyle: new TextStyle(fontSize: 10.0),
          //   activeTextStyle:
          //       new TextStyle(fontSize: 10.0, color: Colors.deepPurpleAccent),
          // )
          // TextButton(
          //     onPressed: () {
          //       _verifyPhone();
          //     },
          //     child: Text('Resend otp'))
        ],
      ),
    );
  }

  Future<void> _setUserLoggedIn(context) async {
    final SharedPreferences prefs = await _prefs;
    // Use isLoggedIn as a checker around the application
    prefs.setBool("isLoggedIn", true);

    String mobile =
        Provider.of<ExamEvaluateModal>(context, listen: false).mobile;

    prefs.setString("mobile", mobile);
  }

  void _actionOnUserPresent(context) {
    _setUserLoggedIn(context);

    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => CompanyCodeScreen()),
        (route) => false);
  }

  _verifyPhone() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+91${widget.phone}',
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance
              .signInWithCredential(credential)
              .then((value) async {
            if (value.user != null) {
              _actionOnUserPresent(context);
            }
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          print(e.message);
        },
        codeSent: (String verficationID, int resendToken) {
          setState(() {
            _verificationCode = verficationID;
          });
        },
        codeAutoRetrievalTimeout: (String verificationID) {
          setState(() {
            _verificationCode = verificationID;
          });
        },
        timeout: Duration(seconds: 120));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _verifyPhone();
  }
}
