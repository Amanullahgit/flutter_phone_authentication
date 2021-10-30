import 'package:flutter/material.dart';

//INFO: Basic Modal with getter and setter functions
class ExamEvaluateModal with ChangeNotifier {
  int _count = 10;
  var _question_answer_mark = new Map<String, int>();

  int _mark_scored = 0;

  int get mark_scored => _mark_scored;

  int get count => _count;

  Map get question_answer_mark => _question_answer_mark;

  void assignMark(Map field, String ans) {
    if (field.containsKey('answer')) {
      String answer = field['answer'];
      print("answers $answer $ans");
      if (answer == ans) {
        String name = field['name'];
        // Can be null and be provided from different source
        int mark = field['mark'];
        _question_answer_mark.update(
          name,
          (value) => mark,
          ifAbsent: () => mark,
        );
      }
    }
  }

  void markScored() {
    var values = _question_answer_mark.values;
    _mark_scored = values.reduce((sum, element) => sum + element);

    notifyListeners();
  }

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
