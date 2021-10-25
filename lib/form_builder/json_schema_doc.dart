import 'dart:convert';
import 'package:flutter/material.dart';

// Input
Map keyboardTypes = {
  "number": TextInputType.number,
};

// exam/step-1
// next: exam/step-2
// This json is pucked from URL step==1
String form = json.encode({
  'fields': [
    {
      'key': 'name',
      'type': 'Input',
      'label': 'Name',
      'placeholder': "Enter Your Name",
      'required': true,
      'completionTime': '1 min',
    },
    {
      'key': 'username',
      'type': 'Input',
      'label': 'Username',
      'placeholder': "Enter Your Username",
      'required': true,
      'hiddenLabel': true,
    },
    {
      'key': 'email',
      'type': 'Email',
      'label': 'email',
      'placeholder': 'Enter your Email',
      'required': true
    },
  ]
});

dynamic response;

Map decorations = {
  'email': InputDecoration(
    hintText: 'Email',
    prefixIcon: Icon(Icons.email),
    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
  ),
  'username': InputDecoration(
    labelText: "Enter your email",
    prefixIcon: Icon(Icons.account_box),
    border: OutlineInputBorder(),
  ),
};


// Declare
// Error handling done by JsonSchema
// new JsonSchema(
//   decorations: decorations,
//   keyboardTypes: keyboardTypes,
//   form: form,
//   onChanged: (dynamic response) {
//     print(jsonEncode(response));
//     this.response = response;
//   },
//   actionSave: (data) {
    // // From URL get the current screen from screens_journey
//     print(data); // on save button click in case of 'exam' pick json from array 
//   },
//   buttonSave: new Container(
//     height: 40.0,
//     color: Colors.blueAccent,
//     child: Center(
//       child: Text("Register",
//           style: TextStyle(
//               color: Colors.white, fontWeight: FontWeight.bold)),
//     ),
//   ),
// ),