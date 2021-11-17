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
        'prefix': '+91',
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
                            'https://res.cloudinary.com/dmtuysbcn/image/upload/v1636916808/icons/telesales-fa_vuzdl5.svg',
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
                            'https://res.cloudinary.com/dmtuysbcn/image/upload/v1636916776/icons/operations-executive-fa_x6s16j.svg',
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
                            'https://res.cloudinary.com/dmtuysbcn/image/upload/v1636916749/icons/back-office-fa_nks9lf.svg',
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
                            'https://res.cloudinary.com/dmtuysbcn/image/upload/v1636916721/icons/sales-fa_r7ztla.svg',
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
                            'https://res.cloudinary.com/dmtuysbcn/image/upload/v1636916694/icons/delivery-fa_cda5zg.svg',
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
                            'https://res.cloudinary.com/dmtuysbcn/image/upload/v1636916653/icons/customer-care-fa_bmur7g.svg',
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
