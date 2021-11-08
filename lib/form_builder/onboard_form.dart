// NOTE: This page should not contain flutter_form_builder library
// import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:supabase/supabase.dart';

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

  void supabaseService(dynamic _formKey) async {
    final client = SupabaseClient('https://nquwrxpqaiohypvambqs.supabase.co',
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYW5vbiIsImlhdCI6MTYzNDI5NDc0OSwiZXhwIjoxOTQ5ODcwNzQ5fQ.78qQYcAGImoc5oAxZC9WMs5DGDYMVjsCWb8qYMhNFUA');

    // insert data
    final insertResponse = await client.from('onboarding').insert([
      {
        "mobile": "+918011230990",
        "fullname": _formKey.currentState.fields['name'].value,
        "location": _formKey.currentState.fields['location'].value,
        "education": _formKey.currentState.fields['education'].value,
        "work_exp": _formKey.currentState.fields['workExp'].value,
        "job_title": _formKey.currentState.fields['jobTitle'].value,
        "company_name":
            _formKey.currentState.fields['currentCompanyName'].value,
        "monthly_income":
            _formKey.currentState.fields['currentMonthlyIncome'].value,
      }
    ]).execute();
    if (insertResponse.error == null) {
      print('>>>>>>>>>>>>>>>>>>insertResponse.data: ${insertResponse.data}');
    } else {
      print('>>>>>>>>>>>>>>>>>>>insertResponse.error: ${insertResponse.error}');
      FocusScope.of(context).unfocus();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(insertResponse.error.message)));
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
                supabaseService(_formKey);

                this.response = response;
              },
            ),
          ]),
        ),
      ),
    );
  }
}

@override
Widget build(BuildContext context) {
  // TODO: implement build
  throw UnimplementedError();
}
