// NOTE: This page should not contain flutter_form_builder library
// import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
        'options': ['Bengaluru', 'Delhi', 'Mumbai', 'Chennai', 'Kolkata'],
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
        'options': [
          'Fresher',
          '1 year',
          '2 year',
          '3 year',
          '4 year',
          '5+ year'
        ],
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

  void postHttp(dynamic _formKey) async {
    var headers = {
      'apikey':
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYW5vbiIsImlhdCI6MTYzNDI5NDc0OSwiZXhwIjoxOTQ5ODcwNzQ5fQ.78qQYcAGImoc5oAxZC9WMs5DGDYMVjsCWb8qYMhNFUA',
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYW5vbiIsImlhdCI6MTYzNDI5NDc0OSwiZXhwIjoxOTQ5ODcwNzQ5fQ.78qQYcAGImoc5oAxZC9WMs5DGDYMVjsCWb8qYMhNFUA',
      'Content-Type': 'application/json',
      'Prefer': 'return=representation'
    };
    var request = http.Request(
        'POST',
        Uri.parse(
            'https://nquwrxpqaiohypvambqs.supabase.co/rest/v1/onboarding'));
    request.body = json.encode({
      "mobile": "+918011230990",
      "fullname": _formKey.currentState['name'],
      "location": _formKey.currentState['location'],
      "education": _formKey.currentState['education'],
      "work_exp": _formKey.currentState['workExp'],
      "job_title": _formKey.currentState['jobTitle'],
      "company_name": _formKey.currentState['currentCompanyName'],
      "monthly_income": _formKey.currentState['currentMonthlyIncome'],
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200 || response.statusCode == 201) {
      print("--------||||||||||||||onboarding||||||||||||||||||||| 200");
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
      // print(await response.stream.bytesToString());
    } else {
      print("--------|||||||||||||||||onboarding|||||||||||||||||| >200");

      FocusScope.of(context).unfocus();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(response.reasonPhrase)));

      // Show toggle route
      // Avoid change route
      // print(response.reasonPhrase);
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Onboarding"),
      ),
      body: new SingleChildScrollView(
        child: new Center(
          child: new Column(children: <Widget>[
            new JsonSchema(
              form: form,
              onSubmitSave: (dynamic response, dynamic _formKey) {
                print("passed onSubmitSave---- $response  $_formKey");
                // Make API call to server
                postHttp(_formKey);

                this.response = response;
              },
            ),
          ]),
        ),
      ),
    );
  }
}
