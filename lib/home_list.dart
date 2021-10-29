import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:phone_auth_project/login.dart';
import './form_builder/ques_journey.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String uid;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Container(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
          width: 300,
          height: 250,
          child: Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                ListTile(
                  // leading: Icon(Icons.arrow_drop_down_circle),
                  title: const Text(
                      'Delivery Boy/Delivery Executive/Delivery Driver/Freshers/Biker/Rider'),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    '₹50,000 a month',
                    style: TextStyle(color: Colors.black.withOpacity(0.6)),
                  ),
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.center,
                  children: [
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
          )),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
}
