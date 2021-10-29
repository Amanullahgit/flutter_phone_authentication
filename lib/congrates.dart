import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import './form_builder/ques_journey.dart';
import './models/eligibility.dart';
import 'package:provider/provider.dart';

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
      body: Column(
        children: [
          Center(child: Text('${context.watch<ExamEvaluateModal>().count}')),
          Text(
              'Congrates, You have completed the test. Our executive will reach you')
        ],
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    final mark = 30;
  }
}
