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
        'key': 'input1',
        'type': 'Input',
        'label': 'Username',
        'placeholder': "Enter Your Username",
        'required': true
      },
    ]
  });
  dynamic response;

  Map decorations = {
    'input1': InputDecoration(
      prefixIcon: Icon(Icons.account_box),
      border: OutlineInputBorder(),
    ),
  };

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("TestLogin"),
      ),
      body: new SingleChildScrollView(
        child: new Center(
          child: new Column(children: <Widget>[
            new Text(
              "TestLogin Form",
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
            ),
            new JsonSchema(
              decorations: decorations,
              form: form,
              onChanged: (dynamic response) {
                this.response = response;
              },
              actionSave: (data) {
                print(data);
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
              buttonSave: new Container(
                height: 40.0,
                color: Colors.blueAccent,
                child: Center(
                  child: Text("TestLogin",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
