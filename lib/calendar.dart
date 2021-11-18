import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';

class HelloCalendar extends StatefulWidget {
  const HelloCalendar({Key key}) : super(key: key);

  @override
  _HelloCalendarState createState() => _HelloCalendarState();
}

class _HelloCalendarState extends State<HelloCalendar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                    "Radhika Dani",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w900,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    "Beautiful Minds",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "Meeting Point",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                    ),
                  ),
                  Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        Icon(Icons.watch_later),
                        Text("30 min"),
                      ],
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        Icon(Icons.videocam_sharp),
                        Text("Web conferencing details provided upon confirmation."),
                      ],
                    ),
                  ),
                ),
                Container(
                  child: new Container(
                    
                    child: Divider(
                    color: Colors.grey,
                    height: 100,
                  )),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

const defaultLetterSpacing = 0.03;
