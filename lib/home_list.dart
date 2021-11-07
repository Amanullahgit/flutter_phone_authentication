import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:phone_auth_project/login.dart';
import 'package:flutter_svg/flutter_svg.dart';

import './form_builder/ques_journey.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String uid;
  String data;

  int _getTotalJobs() {
    final totalJobs = json.decode(data)['jobs'].length;

    return totalJobs;
  }

  _getJob(int index) {
    final job = json.decode(data)['jobs'][index];

    return job;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jobs'),
      ),
      body: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: _getTotalJobs(), // the length
          itemBuilder: (context, index) {
            String title = _getJob(index)['title'];
            String company_name = _getJob(index)['company_name'];
            String location = _getJob(index)['location'];
            String salary = _getJob(index)['salary'];

            return Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: Card(
                  child: Column(
                    children: [
                      ListTile(
                        // leading: Icon(Icons.arrow_drop_down_circle),
                        title: Text(
                          "$title",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.work),
                                Text('$company_name'),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.location_city),
                                Text('$location'),
                              ],
                            ),
                          ],
                        ),
                        trailing: SvgPicture.network(
                          _getJob(index)['icon_uri'],
                          semanticsLabel: 'A shark?!',
                          placeholderBuilder: (BuildContext context) =>
                              Container(
                                  padding: const EdgeInsets.all(30.0),
                                  child: const CircularProgressIndicator()),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            Icon(Icons.money),
                            Text(
                              '$salary',
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.6)),
                            ),
                          ],
                        ),
                      ),
                      ButtonBar(
                        alignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Test comprises of MCQ and aptitude",
                            style: TextStyle(fontSize: 10),
                          ),
                          MaterialButton(
                            color: Theme.of(context).colorScheme.secondary,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        new QuestionJourney(screenIndex: 0)),
                              );
                            },
                            child: const Text(
                              'Start Test',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      // Image.asset('assets/card-sample-image-2.jpg'),
                    ],
                  ),
                ));
          }),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    data = json.encode({
      'jobs': [
        {
          'title': 'Telesales Executives',
          'company_name': 'Uber Technologies',
          'salary': '₹ 1,20,000 - 3,00,000 P.A',
          'location': 'Bengaluru',
          'icon_uri':
              'https://olxjobs-static.aasaanjobs.net/candidate_web/OlxIntegration/telesales-fa.svg',
        },
        {
          'title': 'Delivery Boy',
          'company_name': 'Swiggy',
          'salary': '₹ 1,20,000 - 3,00,000 P.A',
          'location': 'Bengaluru',
          'icon_uri':
              'https://olxjobs-static.aasaanjobs.net/candidate_web/OlxIntegration/delivery-fa.svg',
        },
        {
          'title': 'Customer Care',
          'company_name': 'Swiggy',
          'salary': '₹ 1,20,000 - 3,00,000 P.A',
          'location': 'Bengaluru',
          'icon_uri':
              'https://olxjobs-static.aasaanjobs.net/candidate_web/OlxIntegration/customer-care-fa.svg',
        },
        {
          'title': 'Delivery Boy',
          'company_name': 'Swiggy',
          'salary': '₹ 1,20,000 - 3,00,000 P.A',
          'location': 'Bengaluru',
          'icon_uri':
              'https://olxjobs-static.aasaanjobs.net/candidate_web/OlxIntegration/delivery-fa.svg',
        },
        {
          'title': 'Business Development',
          'company_name': 'Cultfit',
          'salary': '₹ 1,20,000 - 3,00,000 P.A',
          'location': 'Bengaluru',
          'icon_uri':
              'https://olxjobs-static.aasaanjobs.net/candidate_web/OlxIntegration/sales-fa.svg',
        },
        {
          'title': 'Operations Executive',
          'company_name': 'Swiggy',
          'salary': '₹ 1,20,000 - 3,00,000 P.A',
          'location': 'Bengaluru',
          'icon_uri':
              'https://olxjobs-static.aasaanjobs.net/candidate_web/OlxIntegration/operations-executive-fa.svg',
        },
      ]
    });
  }
}
