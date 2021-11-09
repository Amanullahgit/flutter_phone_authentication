import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:phone_auth_project/otp.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import './form_builder/json_schema.dart';
import './../models/eligibility.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _controller = TextEditingController();

  String form = json.encode({
    'disclaimer': "By continuing you agree to our Terms and Condition",
    'fields': [
      {
        'name': 'mobile',
        'type': 'TextInput',
        'keyboardType': 'number',
        'labelText': "Enter 10 digit phone number",
        // not work
        "validation": {
          "required": true,
        }
      },
    ]
  });

  List<Map> _categories = [
    {
      'name': "Sports",
      'icon': Icons.directions_run,
    },
    {
      'name': 'Politics',
      'icon': Icons.gavel,
    },
    {
      'name': 'Science',
      'icon': Icons.wb_sunny,
    },
  ];

  Widget _buildCategoryCards(BuildContext context, int index) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.0),
      child: Card(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: <Widget>[
              Icon(_categories[index]['icon']),
              SizedBox(width: 20.0),
              Text(_categories[index]['name']),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('Dashhire'),
        ),
        body: SingleChildScrollView(
          child: Column(
            // alignment: Alignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 15,
                    children: [
                      Column(
                        children: [
                          SizedBox(),
                          SvgPicture.network(
                            'https://olxjobs-static.aasaanjobs.net/candidate_web/OlxIntegration/telesales-fa.svg',
                            semanticsLabel: 'Telemarketing',
                            placeholderBuilder: (BuildContext context) =>
                                Container(
                                    padding: const EdgeInsets.all(10.0),
                                    child: const CircularProgressIndicator()),
                          ),
                          Text(
                            'Telemarketing',
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 12),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          SvgPicture.network(
                            'https://olxjobs-static.aasaanjobs.net/candidate_web/OlxIntegration/operations-executive-fa.svg',
                            semanticsLabel: 'A shark?!',
                            placeholderBuilder: (BuildContext context) =>
                                Container(
                                    padding: const EdgeInsets.all(10.0),
                                    child: const CircularProgressIndicator()),
                          ),
                          Text(
                            "Operations Executive",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 12),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          SvgPicture.network(
                            'https://olxjobs-static.aasaanjobs.net/candidate_web/OlxIntegration/back-office-fa.svg',
                            semanticsLabel: 'A shark?!',
                            placeholderBuilder: (BuildContext context) =>
                                Container(
                                    padding: const EdgeInsets.all(10.0),
                                    child: const CircularProgressIndicator()),
                          ),
                          Text(
                            "Back Office Executive",
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 12),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          SvgPicture.network(
                            'https://olxjobs-static.aasaanjobs.net/candidate_web/OlxIntegration/sales-fa.svg',
                            semanticsLabel: 'A shark?!',
                            placeholderBuilder: (BuildContext context) =>
                                Container(
                                    padding: const EdgeInsets.all(10.0),
                                    child: const CircularProgressIndicator()),
                          ),
                          Text(
                            "Business Development",
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 12),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          SvgPicture.network(
                            'https://olxjobs-static.aasaanjobs.net/candidate_web/OlxIntegration/delivery-fa.svg',
                            semanticsLabel: 'A shark?!',
                            placeholderBuilder: (BuildContext context) =>
                                Container(
                                    padding: const EdgeInsets.all(10.0),
                                    child: const CircularProgressIndicator()),
                          ),
                          Text(
                            "Delivery boy",
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 12),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          SvgPicture.network(
                            'https://olxjobs-static.aasaanjobs.net/candidate_web/OlxIntegration/customer-care-fa.svg',
                            semanticsLabel: 'A shark?!',
                            placeholderBuilder: (BuildContext context) =>
                                Container(
                                    padding: const EdgeInsets.all(10.0),
                                    child: const CircularProgressIndicator()),
                          ),
                          Text(
                            "Customer Care",
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 12),
                          )
                        ],
                      ),
                    ]),
              ),
              Container(
                child: JsonSchema(
                    // INFO: response here is context
                    onSubmitSave: (dynamic response, _formKey) {
                      String mobile =
                          _formKey.currentState.fields['mobile'].value;

                      // INFO: save user mobile
                      Provider.of<ExamEvaluateModal>(context, listen: false)
                          .set_mobile(mobile);

                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => OTPScreen(mobile)));

                      print("response $response");
                    },
                    form: form),
              ),
            ],
          ),
        ));
  }
}
