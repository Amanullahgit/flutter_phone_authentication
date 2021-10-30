// NOTE: This page should not contain flutter_form_builder library
// import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'json_schema.dart';
import '../home_list.dart';

class OnboardingScreen extends StatefulWidget {
  OnboardingScreen({Key key}) : super(key: key);
  @override
  _OnboardingScreen createState() => new _OnboardingScreen();
}

class _OnboardingScreen extends State<OnboardingScreen> {
  String form = json.encode({
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
      {
        'name': 'location',
        'type': 'Dropdown',
        'labelText': "Select Location",
        'options': ['Bengalure', 'Delhi', 'Mumbai', 'Chennai', 'Kolkata'],
        "validation": {
          "required": true,
        },
      },
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
      },
      {
        'name': 'workExp',
        'type': 'Dropdown',
        'labelText': "Total Work Experience",
        'options': ['1 year', '2 year', '3 year', '4 year', '5+ year'],
        "validation": {
          "required": true,
        },
      },
      {
        'name': 'jobTitle',
        'type': 'TextInput',
        'labelText': "Job Title",
        // not work
        "validation": {
          "required": true,
        }
      },
      {
        'name': 'currentCompanyName',
        'type': 'TextInput',
        'labelText': "Current Company Name",
        // not work
        "validation": {
          "required": true,
        }
      },
      {
        'name': 'currentMonthlyIncome',
        'type': 'TextInput',
        'labelText': "Current montly income",
        "validation": {
          "required": true,
        },
        // not work
        "keyboardType": 'number'
      },
    ]
  });
  dynamic response;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Onboard"),
      ),
      body: new SingleChildScrollView(
        child: new Center(
          child: new Column(children: <Widget>[
            new JsonSchema(
              form: form,
              onSubmitSave: (dynamic response) {
                print("passed onSubmitSave---- $response");

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );

                this.response = response;
              },
            ),
          ]),
        ),
      ),
    );
  }
}
