import 'package:flutter/material.dart';

//INFO: Basic Modal with getter and setter functions
class ExamEvaluateModal with ChangeNotifier {
  int _count = 10;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }

  String _eligiblityMessage = "default msg";
  bool _isEligible;

  void checkEligiblity(int age) {
    if (age >= 18)
      eligibleForLicense();
    else
      notEligibleForLicense();
  }

  void eligibleForLicense() {
    _eligiblityMessage = "You are eligible to apply for Driving License";
    _isEligible = true;

    //Call this whenever there is some change in any field of change notifier.
    notifyListeners();
  }

  void notEligibleForLicense() {
    _eligiblityMessage = "You are not eligible to apply for Driving License";
    _isEligible = false;

    //Call this whenever there is some change in any field of change notifier.
    notifyListeners();
  }

  //Getter for Eligiblity message
  String get eligiblityMessage => _eligiblityMessage;

  //Getter for Eligiblity flag
  bool get isEligible => _isEligible;
}
