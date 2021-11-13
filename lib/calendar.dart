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
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Column(children: [
              Text(
                "Radhika Dani",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w900,
                  color: Colors.grey,
                ),
              ),
              Text(
                "Beautiful Minds"
              ),
              Text(
                "Meeting Point"
              )
            ],)
          ],
        ),
      )
    );
  }
}