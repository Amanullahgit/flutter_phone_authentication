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
import '../congrates.dart';

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
  String _getFormScreen() {
    final screenIndex = widget.screenIndex;
    // journey is defined

    final form = json.decode(journey)['screens'][screenIndex];

    return json.encode(form);
  }

  int _getScreenCount() {
    final screenCount = json.decode(journey)['screens'].length;

    return screenCount;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
            title: new Text("Test"), automaticallyImplyLeading: true),
        body: new SingleChildScrollView(
            child: new Center(
                child: new Column(children: <Widget>[
          JsonSchema(
              onSubmitSave: (dynamic response) {
                // print("passed onSubmitSave---- $response");
                // print(widget.screenIndex);
                // print(_getScreenCount());

                // This condition should be tight
                // When screenIndex == _getScreenCount() index error occur
                if (widget.screenIndex == _getScreenCount() - 1) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => new Congrates()));
                } else {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => new QuestionJourney(
                              screenIndex: widget.screenIndex + 1)));
                }
              },
              form: _getFormScreen()),
        ]))));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // NOTE: on each screen try getting the result on questions and score (try evaluating answers on submit)
    // ex. say screen 1 have 2 question. On screen calculate the partial score and update _score in Provider

    journey = json.encode({
      'timeLimit': 60,
      'screens': [
        // 1st screen
        {
          // define other params in screen
          'question': "Find the number of A in BBBAAAACCCAADDDDDAeeeeeA",
          'mark': 10,
          // calculate question's answer mark in Widget; update _score
          'fields': [
            {
              'name': 'q1',
              'type': 'Radio',
              'labelText': "",
              'options': ['7', '8', '6', '5'],
              // not work
              "validation": {
                "required": true,
              }
            }
          ]
        },
        // 2nd screen
        {
          'question': "Put your quesion here",
          'mark': 10,
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
              'question': "Put your quesion here",
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
  }
}
