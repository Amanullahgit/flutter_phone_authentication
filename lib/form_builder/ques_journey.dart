// Write in ideas to question journey

// import 'dart:convert';

// Make it a class
// define getter and setter
//
// current active screen: index in screens
// next screen, index : based on form1, form2,... JsonSchema should be able to render form
// previous screen, index in screens
// String screens_journey = json.encode({
//   'journeyTime': '60', // in min
//   'screens': [form1, form2, form3, form4, form5]
// });
import 'dart:convert';
import 'package:flutter/material.dart';

// QuestionJourney extends Journey
// In future there can be other journeys that can be extracted from Journey class
class QuestionJourney extends StatefulWidget {
  QuestionJourney({Key key, @required this.index}) : super(key: key);

  final int index;

  @override
  _QuestionJourneyState createState() => _QuestionJourneyState();
}

class _QuestionJourneyState extends State<QuestionJourney> {
  String journey = json.encode({
    'screens': [
      {
        'fields': [
          {
            'name': 'name',
            'type': 'TextInput',
            'labelText': "Enter your Name",
            // not work
            "validation": {
              "required": true,
            }
          }
        ]
      },
      {
        'fields': [
          {
            'name': 'location',
            'type': 'Dropdown',
            'labelText': "Select Location",
            'options': ['Bengalure', 'Delhi', 'Mumbai', 'Chennai', 'Kolkata'],
            "validation": {
              "required": true,
            },
          }
        ]
      },
      {
        'fields': [
          {
            'name': 'education',
            'type': 'Dropdown',
            'labelText': "Your Education",
            'options': [
              '10th or below 10th',
              '12th pass',
              'Diploma',
              'ITI',
              'Graduate',
              'Post Graduate'
            ],
            "validation": {
              "required": true,
            },
          }
        ]
      },
    ]
  });

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
}
