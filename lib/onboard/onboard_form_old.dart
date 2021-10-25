import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:phone_auth_project/home.dart';
import './../home.dart';
// import 'package:intl/intl.dart';

class Onboarding extends StatefulWidget {
  @override
  OnboardingState createState() {
    return OnboardingState();
  }
}

class OnboardingState extends State<Onboarding> {
  bool autoValidate = true;
  bool readOnly = false;
  bool showSegmentedControl = true;
  final _formKey = GlobalKey<FormBuilderState>();
  bool _ageHasError = false;
  bool _locationHasError = false;
  bool _nameHasError = false;
  bool _educationHasError = false;
  bool _jobTitleHasError = false;
  bool _currentCompanyNameHasError = false;
  bool _currentMonthlyIncomeHasError = false;

  final ValueChanged _onChanged = (val) => print(val);
  var locationOptions = ['Bengalure', 'Delhi', 'Mumbai', 'Chennai', 'Kolkata'];
  var educationOptions = [
    '10th or below 10th',
    '12th pass',
    'Diploma',
    'ITI',
    'Graduate',
    'Post Graduate'
  ];
  var workExpOptions = ['1 year', '2 year', '3 year', '4 year', '5+ year'];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text('Onboarding'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                FormBuilder(
                  key: _formKey,
                  // enabled: false,
                  autovalidateMode: AutovalidateMode.disabled,
                  initialValue: {
                    'movie_rating': 5,
                    'best_language': 'Dart',
                    '': '13',
                    'location': 'Bengalure',
                    'workExp': '3 year',
                  },
                  skipDisabled: true,
                  child: Column(
                    children: <Widget>[
                      const SizedBox(
                        height: 10,
                      ),
                      FormBuilderTextField(
                        autovalidateMode: AutovalidateMode.always,
                        name: 'name',
                        decoration: InputDecoration(
                          labelText: 'Name',
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (val) {
                          setState(() {
                            _nameHasError = !(_formKey
                                    .currentState?.fields['name']
                                    ?.validate() ??
                                false);
                          });
                        },
                        // valueTransformer: (text) => num.tryParse(text),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(context),
                          FormBuilderValidators.max(context, 100),
                        ]),
                        // initialValue: '12',
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      FormBuilderDropdown<String>(
                        // autovalidate: true,
                        name: 'location',
                        decoration: InputDecoration(
                          labelText: 'Location',
                          border: OutlineInputBorder(),
                        ),
                        // initialValue: 'Male',
                        allowClear: true,
                        hint: Text('Select Location'),
                        validator: FormBuilderValidators.compose(
                            [FormBuilderValidators.required(context)]),
                        items: locationOptions
                            .map((location) => DropdownMenuItem(
                                  value: location,
                                  child: Text(location),
                                ))
                            .toList(),
                        onChanged: (val) {
                          setState(() {
                            _locationHasError = !(_formKey
                                    .currentState?.fields['location']
                                    ?.validate() ??
                                false);
                          });
                        },
                        valueTransformer: (val) => val?.toString(),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      FormBuilderDropdown<String>(
                        // autovalidate: true,
                        name: 'education',
                        decoration: InputDecoration(
                          labelText: 'Education',
                          border: OutlineInputBorder(),
                        ),
                        // initialValue: 'Male',
                        allowClear: true,
                        hint: Text('Select Education'),
                        validator: FormBuilderValidators.compose(
                            [FormBuilderValidators.required(context)]),
                        items: educationOptions
                            .map((education) => DropdownMenuItem(
                                  value: education,
                                  child: Text(education),
                                ))
                            .toList(),
                        onChanged: (val) {
                          setState(() {
                            _educationHasError = !(_formKey
                                    .currentState?.fields['education']
                                    ?.validate() ??
                                false);
                          });
                        },
                        valueTransformer: (val) => val?.toString(),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      FormBuilderDropdown<String>(
                        // autovalidate: true,
                        name: 'workExp',
                        decoration: InputDecoration(
                          labelText: 'Total Work Experience',
                          border: OutlineInputBorder(),
                        ),
                        // initialValue: 'Male',
                        allowClear: true,
                        hint: Text('Experience'),
                        validator: FormBuilderValidators.compose(
                            [FormBuilderValidators.required(context)]),
                        items: workExpOptions
                            .map((location) => DropdownMenuItem(
                                  value: location,
                                  child: Text(location),
                                ))
                            .toList(),
                        onChanged: (val) {
                          setState(() {
                            _locationHasError = !(_formKey
                                    .currentState?.fields['workExp']
                                    ?.validate() ??
                                false);
                          });
                        },
                        valueTransformer: (val) => val?.toString(),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      FormBuilderTextField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        name: 'jobTitle',
                        decoration: InputDecoration(
                          labelText: 'Job Title',
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (val) {
                          setState(() {
                            _jobTitleHasError = !(_formKey
                                    .currentState?.fields['jobTitle']
                                    ?.validate() ??
                                false);
                          });
                        },
                        // valueTransformer: (text) => num.tryParse(text),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(context),
                          FormBuilderValidators.max(context, 100),
                        ]),
                        // initialValue: '12',
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      FormBuilderTextField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        name: 'currentCompanyName',
                        decoration: InputDecoration(
                          labelText: 'Current Company Name',
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (val) {
                          setState(() {
                            _currentCompanyNameHasError = !(_formKey
                                    .currentState?.fields['currentCompanyName']
                                    ?.validate() ??
                                false);
                          });
                        },
                        // valueTransformer: (text) => num.tryParse(text),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(context),
                          FormBuilderValidators.max(context, 100),
                        ]),
                        // initialValue: '12',
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      FormBuilderTextField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        name: 'currentMonthlyIncome',
                        decoration: InputDecoration(
                          labelText: 'Current Monthly Income',
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (val) {
                          setState(() {
                            _currentMonthlyIncomeHasError = !(_formKey
                                    .currentState
                                    ?.fields['currentMonthlyIncome']
                                    ?.validate() ??
                                false);
                          });
                        },
                        // valueTransformer: (text) => num.tryParse(text),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(context),
                        ]),
                        // initialValue: '12',
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                      ),
                    ],
                  ),
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: MaterialButton(
                        color: Theme.of(context).colorScheme.secondary,
                        onPressed: () {
                          if (_formKey.currentState?.saveAndValidate() ??
                              false) {
                            print(_formKey.currentState?.value);
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(builder: (context) => Home()),
                                (route) => false);
                          } else {
                            print(_formKey.currentState?.value);
                            print('validation failed');
                          }
                        },
                        child: const Text(
                          'Submit',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          _formKey.currentState?.reset();
                        },
                        // color: Theme.of(context).colorScheme.secondary,
                        child: Text(
                          'Reset',
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
