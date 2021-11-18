import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';

class HelloScreen extends StatefulWidget {
  const HelloScreen({Key key}) : super(key: key);

  @override
  _HelloScreenState createState() => _HelloScreenState();
}

class _HelloScreenState extends State<HelloScreen> {
  Map a = {};

  List<Map> data = [
    {"title": 'A', "subtitle": 'Hindi'},
    {"title": 'A', "subtitle": 'English'},
    {"title": 'C', "subtitle": 'Kannda'},
    {"title": 'C', "subtitle": 'Bengali'},
    {"title": 'C', "subtitle": 'Telugu'},
    {"title": 'C', "subtitle": 'Tamil'},
    {"title": 'C', "subtitle": 'Gujarati'},
    {"title": 'C', "subtitle": 'Marathi'},
    {"title": 'C', "subtitle": 'Odiya'},
    {"title": 'C', "subtitle": 'Assames'},
    {"title": 'C', "subtitle": 'Malayalam'},
  ];

  List<Widget> _myLanguageOptions() {
    List<Widget> result = [];

    for (var i = 0; i < data.length; i++) {
      Widget x = Container(
          padding: EdgeInsets.all(5.0),
          width: 120,
          height: 90,
          child: Card(
            color: Colors.white,
            clipBehavior: Clip.antiAlias,
            shadowColor: Colors.black,
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    data[i]['title'],
                    textAlign: TextAlign.center,
                  ),
                  subtitle: Text(
                    data[i]['subtitle'],
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black.withOpacity(0.6)),
                  ),
                ),
              ],
            ),
          ));

      result.add(x);
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      color: Colors.white,
      padding: EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Column(children: [
              Text(
                "Choose Language",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              Text(
                "Welcome to apna app",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
              )
            ]),
            Wrap(
              children: _myLanguageOptions(),
            ),
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 5,
              children: [
                Container(
                  width: 300,
                  height: 100,
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    color: Colors.brown[50],
                    child: Column(
                      children: [
                        ListTile(
                            title: const Text(
                          'Please choose a language from above. You can change language from profile settings later.',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.brown),
                        )),
                      ],
                    ),
                  ),
                ),
                Container(),
                Center(
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.green[200])),
                    child: Text(
                      'Continue',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    onPressed: () {
                      // Respond to button press
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
