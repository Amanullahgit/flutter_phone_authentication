import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './form_builder/json_schema.dart';
import 'form_builder/onboard_form.dart';
import './../models/eligibility.dart';
import 'package:phone_auth_project/home_list.dart';
import './utils/supabase_service.dart';

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
      color: Colors.purpleAccent[100],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Text(""),
          ),
          Container(
            child: JsonSchema(
                // INFO: response here is context
                onSubmitSave: (dynamic response, _formKey) async {
                  String companyCode =
                      _formKey.currentState.fields['companyCode'].value;

                  // INFO: save company code to state
                  Provider.of<ExamEvaluateModal>(context, listen: false)
                      .set_company_code(companyCode);

                  var mobile =
                      Provider.of<ExamEvaluateModal>(context, listen: false)
                          .mobile;

                  SupabaseService supabase = new SupabaseService();
                  // TODO: This filter does not works for mobile: +918011230914
                  final selectResponse =
                      await supabase.filter("onboarding", "mobile", mobile);

                  final List data = selectResponse.data;
                  if (data.length == 0) {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OnboardingScreen()),
                        (route) => false);
                  } else {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                        (route) => false);
                  }
                },
                form: form),
          ),
        ],
      ),
    );
  }
}
