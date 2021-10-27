import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import './form_builder/ques_journey.dart';

class Congrates extends StatefulWidget {
  @override
  _CongratesState createState() => _CongratesState();
}

class _CongratesState extends State<Congrates> {
  String uid;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Result'),
      ),
      body: Center(child: Text("Congrates")),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
}
