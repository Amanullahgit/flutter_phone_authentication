import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './form_builder/json_schema.dart';
import 'form_builder/onboard_form.dart';
import './../models/eligibility.dart';
import 'package:phone_auth_project/home_list.dart';

class CompanyCodeScreen extends StatefulWidget {
  CompanyCodeScreen({Key key}) : super(key: key);

  @override
  _CompanyCodeScreenState createState() => _CompanyCodeScreenState();
}

class _CompanyCodeScreenState extends State<CompanyCodeScreen> {
  String form = json.encode({
    'disclaimer': "By continuing you agree to our Terms and Condition",
    'fields': [
      {
        'name': 'companyCode',
        'type': 'TextInput',
        'keyboardType': 'number',
        'labelText': "Enter Company Code",
        // not work
        "validation": {
          "required": true,
        }
      },
    ]
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: JsonSchema(
          // INFO: response here is context
          onSubmitSave: (dynamic response, _formKey) {
            String companyCode =
                _formKey.currentState.fields['companyCode'].value;

            // INFO: save user mobile
            Provider.of<ExamEvaluateModal>(context, listen: false)
                .set_company_code(companyCode);

            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
                (route) => false);

            print("response $response");
          },
          form: form),
    );
  }
}
