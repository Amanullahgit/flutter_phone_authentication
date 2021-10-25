// NOTE: This page should not contain flutter_form_builder library
// import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'json_schema.dart';

class TestLogin extends StatefulWidget {
  TestLogin({Key key}) : super(key: key);
  @override
  _Login createState() => new _Login();
}

class _Login extends State<TestLogin> {
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
        // not work
        'options': ['Bengalure', 'Delhi', 'Mumbai', 'Chennai', 'Kolkata'],
        "validation": {
          "required": true,
        },
      },
      {
        'name': 'education',
        'type': 'Dropdown',
        'labelText': "Your Education",
        // not work
        'options': ['Bengalure', 'Delhi', 'Mumbai', 'Chennai', 'Kolkata'],
        "validation": {
          "required": true,
        },
      },
      {
        'name': 'workExp',
        'type': 'Dropdown',
        'labelText': "Total Work Experience",
        // not work
        'options': ['Bengalure', 'Delhi', 'Mumbai', 'Chennai', 'Kolkata'],
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
              onChanged: (dynamic response) {
                print("passed onChange---- $response");
                // User get json with values
                // Called everytime any field is being changed
                //response: {fields: [{key: input1, name: username, type: Input, label: Username, placeholder: Enter Your Username, required: true, value: masih}, {key: input1, name: lastCompany, type: Input, label: Name, placeholder: Last Company Name, required: false, value: chqbook2}]}
                this.response = response;
              },
            ),
          ]),
        ),
      ),
    );
  }
}
