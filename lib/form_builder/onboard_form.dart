// NOTE: This page should not contain flutter_form_builder library
// import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utils/supabase_service.dart';
import '../models/eligibility.dart';
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
          "required": false,
        }
      },
      {
        'name': 'currentCompanyName',
        'type': 'TextInput',
        'labelText': "Current Company Name",
        // not work
        "validation": {
          "required": false,
        }
      },
      {
        'name': 'currentMonthlyIncome',
        'type': 'TextInput',
        'prefix': '₹',
        'labelText': "Current montly income",
        "validation": {
          "required": false,
        },
        // not work
        "keyboardType": 'number'
      },
    ]
  });
  dynamic response;

  void setOnboardingData(context, dynamic _formKey) async {
    String mobile =
        Provider.of<ExamEvaluateModal>(context, listen: false).mobile;

    print("$mobile >>>>");
    SupabaseService supabase = new SupabaseService();
    final selectResponse = await supabase.insert("onboarding", [
      {
        "mobile": mobile,
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
    ]);

    if (selectResponse.error == null) {
      print('response.data: ${selectResponse.data}');
      FocusScope.of(context).unfocus();
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Congrates onboarding successfull")));

      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
          (route) => false);
      // print("<><><><><><><><><><><>< $data");
    } else {
      // print('>>>>>>>>>>>>>>>>>>>selectResponse.error: ${selectResponse.error}');
      FocusScope.of(context).unfocus();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(selectResponse.error.message)));
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
                setOnboardingData(context, _formKey);

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
