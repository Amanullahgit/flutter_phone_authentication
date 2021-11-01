import 'package:flutter/material.dart';
import 'package:phone_auth_project/home_list.dart';
import 'package:provider/provider.dart';
import './models/eligibility.dart';
import './home_list.dart';

class Congrates extends StatelessWidget {
//Remark Logic
  String resultPhrase(int resultScore) {
    String resultText;
    if (resultScore >= 41) {
      resultText = 'You are awesome!';
      print(resultScore);
    } else if (resultScore >= 31) {
      resultText = 'Pretty likeable!';
      print(resultScore);
    } else if (resultScore >= 21) {
      resultText = 'You need to work more!';
    } else if (resultScore >= 1) {
      resultText = 'You need to work hard!';
    } else {
      resultText = 'This is a poor score!';
      print(resultScore);
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    int _markScored =
        Provider.of<ExamEvaluateModal>(context, listen: false).mark_scored;
    return Scaffold(
        appBar: AppBar(title: Text('Result')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                // resultPhrase(context.watch<ExamEvaluateModal>().mark_scored),
                resultPhrase(_markScored),
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ), //Text
              Text(
                'Score $_markScored',
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Text(
                "Our executive will reach out to you",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              //Text
              MaterialButton(
                child: Text(
                  'Restart Quiz!',
                ), //Text
                textColor: Colors.blue,
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                      (route) => false);
                },
              ), //FlatButton
            ], //<Widget>[]
          ), //Column
        ) //C,
        );
  }
}


// When to use watch, works only in ""
// context.watch<ExamEvaluateModal>().mark_scored