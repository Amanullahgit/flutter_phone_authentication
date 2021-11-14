import 'package:flutter/material.dart';
import 'package:phone_auth_project/home_list.dart';
import 'package:provider/provider.dart';
import './models/eligibility.dart';
import './home_list.dart';
import './utils/supabase_service.dart';
import './widgets/button_widget.dart';

class Congrates extends StatelessWidget {
  bool _isInitialized;
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

  dynamic submitApplication(context) async {
    String mobile =
        Provider.of<ExamEvaluateModal>(context, listen: false).mobile;

    Map job =
        Provider.of<ExamEvaluateModal>(context, listen: false).job_selected;

    int jobId = job["id"];

    int markScored =
        Provider.of<ExamEvaluateModal>(context, listen: false).mark_scored;

    Map questionAnswer =
        Provider.of<ExamEvaluateModal>(context, listen: false).question_answer;

    print("$mobile >>>> $jobId >>> $markScored >>> $questionAnswer");
    SupabaseService supabase = new SupabaseService();
    final selectResponse = await supabase.insert("application", [
      {
        "mobile": mobile,
        "job_id": jobId,
        "test_score": markScored,
        "answers": questionAnswer
      }
    ]);

    if (selectResponse.error == null) {
      print('response.data: ${selectResponse.data}');
      FocusScope.of(context).unfocus();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Congrates your application is submitted with us")));

      // print("<><><><><><><><><><><>< $data");
    } else {
      // print('>>>>>>>>>>>>>>>>>>>selectResponse.error: ${selectResponse.error}');
      FocusScope.of(context).unfocus();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(selectResponse.error.message)));
    }
  }

  @override
  Widget build(BuildContext context) {
    if (this._isInitialized == null || !this._isInitialized) {
      submitApplication(context);
      this._isInitialized = true;
    }

    // TODO: Not a good place to add, place it somewhere
    // calculate total mark
    // context.read<ExamEvaluateModal>().markScored();
    Provider.of<ExamEvaluateModal>(context, listen: false).markScored();
    int _markScored =
        Provider.of<ExamEvaluateModal>(context, listen: false).mark_scored;

    return FutureBuilder(
        // future: submitApplication(context),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Center(child: Text('Please wait its loading...'));
      } else {
        // TODO: Business logic what happens when API has error
        if (snapshot.hasError)
          return Center(child: Text('Error: ${snapshot.error}'));
        else {
          return Scaffold(
              appBar: AppBar(title: Text('Result')),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      // resultPhrase(context.watch<ExamEvaluateModal>().mark_scored),
                      resultPhrase(_markScored),
                      style:
                          TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ), //Text
                    Text(
                      'Score $_markScored',
                      style:
                          TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "Our executive will reach out to you",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),

                    // RoundedButtonWidget(
                    //     buttonText: 'Submit your Score with us',
                    //     onPressed: () {
                    //       submitApplication(context);
                    //     }),

                    //Text
                    MaterialButton(
                      child: Text(
                        'Restart Quiz!',
                      ), //Text
                      textColor: Colors.blue,
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()),
                            (route) => false);
                      },
                    ), //FlatButton
                  ], //<Widget>[]
                ), //Column
              ) //C,
              );
        }
      }
    });
  }
}


// When to use watch, works only in ""
// context.watch<ExamEvaluateModal>().mark_scored