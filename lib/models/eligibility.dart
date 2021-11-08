import 'package:flutter/material.dart';

//INFO: Basic Modal with getter and setter functions
class ExamEvaluateModal with ChangeNotifier {
  int _count = 10;
  var _question_answer_mark = new Map<String, int>();
  var _quesion_answer = new Map<String, String>();
  var _job_selected = new Map<String, dynamic>();

  // JSON is been converted to string and been moved around in state
  String _ques_journey = "";
  String _mobile = "";

  int _mark_scored = 0;

  int get mark_scored => _mark_scored;

  int get count => _count;

  Map get question_answer_mark => _question_answer_mark;

  Map get question_answer => _quesion_answer;

  Map get job_selected => _job_selected;

  get ques_journey => _ques_journey;

  String get mobile => _mobile;

  void set_ques_journey(journey) {
    _ques_journey = journey;
  }

  void job_select(Map job) {
    _job_selected = job;
  }

  void set_mobile(String mobile) {
    _mobile = mobile;
  }

  // INFO: consider field {answer} , match user's 'ans' with field answer and allocate mark
  void assignMark(Map field, String ans) {
    // INFO: start evaluating answer when, question comes with answer
    if (field.containsKey('answer')) {
      String answer = field['answer'];

      String name = field['name'];

      print("answers $answer $ans");

      _quesion_answer.update(
        name,
        (value) => value,
        ifAbsent: () => ans,
      );

      if (answer.toLowerCase() == ans.toLowerCase()) {
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

  // INFO: sum marks wrt to field name
  void markScored() {
    var values = _question_answer_mark.values;
    _mark_scored = values.reduce((sum, element) => sum + element);

    // notifyListeners();
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
