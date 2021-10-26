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

import './json_schema.dart';

// QuestionJourney extends Journey
// In future there can be other journeys that can be extracted from Journey class
class QuestionJourney extends StatefulWidget {
  QuestionJourney({Key key, this.screenIndex});

  final int screenIndex;

  @override
  _QuestionJourneyState createState() => _QuestionJourneyState();
}

class _QuestionJourneyState extends State<QuestionJourney> {
  String journey;
  dynamic response;

  // // Make a method: params: journey and index
  // // return: JsonSchema(onSubmitSave: implement<Navigation>, form: implement<journey json>)
  // JsonSchema getFormInScreen() {
  //   final screenIndex = widget.screenIndex;
  //   // journey is defined

  //   final form = json.decode(journey)['screens'][screenIndex];

  //   return JsonSchema(form: form);
  // }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Test"),
        ),
        body: new SingleChildScrollView(
            child: new Center(
                child: new Column(children: <Widget>[
          JsonSchema(
              onSubmitSave: (dynamic response) {
                print("passed onSubmitSave---- $response");
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            new QuestionJourney(screenIndex: 1)),
                    (route) => false);
                // Control action after submit button click
              },
              form: json.encode({
                'fields': [
                  {
                    'name': 'name',
                    'type': 'TextInput',
                    'labelText': "Enter your Name",
                    // not work
                    "validation": {
                      "required": true,
                    }
                  },
                ]
              }))
        ]))));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    journey = json.encode({
      'timeLimit': 60,
      'screens': [
        // 1st screen
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
        // 2nd screen
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
        // {
        //   'fields': [
        //     {
        //       'name': 'education',
        //       'type': 'Dropdown',
        //       'labelText': "Your Education",
        //       'options': [
        //         '10th or below 10th',
        //         '12th pass',
        //         'Diploma',
        //         'ITI',
        //         'Graduate',
        //         'Post Graduate'
        //       ],
        //       "validation": {
        //         "required": true,
        //       },
        //     }
        //   ]
        // },
      ]
    });
  }
}
