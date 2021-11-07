import 'package:flutter/material.dart';
import 'package:phone_auth_project/otp.dart';
import 'package:flutter_svg/flutter_svg.dart';

import './widgets/button_widget.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _controller = TextEditingController();

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
        appBar: AppBar(
          title: Text('Dashhire'),
        ),
        body: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              child: GridView.count(
                  padding: EdgeInsets.all(16),
                  // Create a grid with 2 columns. If you change the scrollDirection to
                  // horizontal, this produces 2 rows.
                  crossAxisCount: 3,
                  // Generate 100 widgets that display their index in the List.
                  children: [
                    Column(
                      children: [
                        SvgPicture.network(
                          'https://olxjobs-static.aasaanjobs.net/candidate_web/OlxIntegration/telesales-fa.svg',
                          semanticsLabel: 'Telemarketing',
                          placeholderBuilder: (BuildContext context) =>
                              Container(
                                  padding: const EdgeInsets.all(30.0),
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
                                  padding: const EdgeInsets.all(30.0),
                                  child: const CircularProgressIndicator()),
                        ),
                        Text(
                          "Operations Executive",
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
                                  padding: const EdgeInsets.all(30.0),
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
                                  padding: const EdgeInsets.all(30.0),
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
                                  padding: const EdgeInsets.all(30.0),
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
                                  padding: const EdgeInsets.all(30.0),
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(children: [
                    Container(
                      margin: EdgeInsets.only(top: 40, right: 10, left: 10),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Enter 10 digit phone number',
                          prefix: Padding(
                            padding: EdgeInsets.all(4),
                            child: Text('+91'),
                          ),
                          border: OutlineInputBorder(),
                        ),
                        maxLength: 10,
                        keyboardType: TextInputType.number,
                        controller: _controller,
                      ),
                    )
                  ]),
                  Container(
                    margin: EdgeInsets.all(10),
                    width: double.infinity,
                    child: Column(
                      children: [
                        RoundedButtonWidget(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    OTPScreen(_controller.text)));
                          },
                          buttonText: 'Continue',
                        ),
                        Text(
                            'By continuing you agree to our Terms and Condition')
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
