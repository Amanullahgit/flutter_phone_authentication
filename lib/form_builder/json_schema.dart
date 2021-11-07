import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';

import 'package:meta/meta.dart';
import './../models/eligibility.dart';
import './../widgets/button_widget.dart';

// INFO: JsonSchema can build "a screen" form using json
// Valid input json, that JsonSchema operated on
// {
//   'question': "Put your quesion here",
//   'mark': 10,
//   'fields': [
//     {
//       'name': 'location',
//       'type': 'Dropdown',
//       'labelText': "Select Location",
//       'options': ['Bengalure', 'Delhi', 'Mumbai', 'Chennai', 'Kolkata'],
//       "validation": {
//         "required": true,
//       },
//     }
//   ]
// }
class JsonSchema extends StatefulWidget {
  const JsonSchema({
    @required this.form,
    @required this.onSubmitSave,
    this.onChanged,
    this.padding,
    this.formMap,
    this.autovalidateMode,
    this.errorMessages = const {},
    this.validations = const {},
    this.decorations = const {},
    this.keyboardTypes = const {},
    // Currently using flutter_form_builder function
    this.buttonSave,
    this.actionSave,
  });

  final Map errorMessages;
  final Map validations;
  final Map decorations;
  final Map keyboardTypes;
  final String form;
  final Map formMap;
  final double padding;
  final Widget buttonSave;
  final Function actionSave;
  final Function onSubmitSave;
  final ValueChanged<dynamic> onChanged;
  final AutovalidateMode autovalidateMode;

  @override
  _CoreFormState createState() =>
      new _CoreFormState(formMap ?? json.decode(form));
}

class _CoreFormState extends State<JsonSchema> {
  final dynamic formGeneral;
  var options = ['loadind'];
  bool _locationHasError = false;

  int radioValue;

  List<Widget> jsonToForm() {
    List<Widget> listWidget = new List<Widget>();

    // INFO: create some space
    listWidget.add(const SizedBox(height: 15));

    // INFO: Question section in screen: question related widget get pushed to listWidget
    if (formGeneral['question'] != null) {
      if (formGeneral['question']['type'] == 'Text') {
        listWidget.add(Text(
          formGeneral['question']['source'],
          style: new TextStyle(fontSize: 16.0, fontStyle: FontStyle.normal),
        ));
      } else if (formGeneral['question']['type'] == 'Image') {
        final imgURL = formGeneral['question']['source'];
        listWidget.add(
          // Show loader while image is being loaded
          Image.network(
            imgURL,
            height: 140,
            fit: BoxFit.fill,
            loadingBuilder: (BuildContext context, Widget child,
                ImageChunkEvent loadingProgress) {
              if (loadingProgress == null) return child;
              return Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes
                      : null,
                ),
              );
            },
          ),
        );
      }
    }

    // INFO: used flutter_form_fields to render fields on screen
    for (var count = 0; count < formGeneral['fields'].length; count++) {
      listWidget.add(const SizedBox(height: 15));

      Map item = formGeneral['fields'][count];

      // var fieldController;

      if (item['type'] == "TextInput") {
        // fieldController = TextFie
        listWidget.add(new FormBuilderTextField(
          // controller: fieldController,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          name: item['name'],
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: item['labelText'],

            // helperText: 'Helper text',
            // hintText: 'Hint text',
          ),
          onChanged: (val) {
            print("val $val");
          },
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(context),
          ]),
          keyboardType: TextInputType.name,
          textInputAction: TextInputAction.next,
        ));
      } else if (item['type'] == "Dropdown") {
        // This conversion is required for dropdown options listing
        List<dynamic> options = item['options'];
        List<String> optionsList = options.cast<String>();

        // dynamic op = List<String>(item['options']);
        listWidget.add(new FormBuilderDropdown<String>(
          // autovalidate: true,
          name: item['name'],
          decoration: InputDecoration(
            labelText: item['labelText'],
            border: OutlineInputBorder(),
          ),
          // initialValue: 'Male',
          allowClear: true,
          hint: Text('Select options'),
          validator: FormBuilderValidators.compose(
              [FormBuilderValidators.required(context)]),
          items: optionsList
              .map((location) => DropdownMenuItem(
                    value: location,
                    child: Text(location),
                  ))
              .toList(),
          onChanged: (val) {
            setState(() {
              _locationHasError =
                  !(_formKey.currentState?.fields['location']?.validate() ??
                      false);
            });
          },
          valueTransformer: (val) => val?.toString(),
        ));
      } else if (item['type'] == "Radio") {
        // This conversion is required for dropdown options listing
        List<dynamic> options = item['options'];
        List<String> optionsList = options.cast<String>();

        listWidget.add(FormBuilderRadioGroup<String>(
          initialValue: null,
          name: item['name'],
          // onChanged: _onChanged,
          validator: FormBuilderValidators.compose(
              [FormBuilderValidators.required(context)]),
          options: optionsList
              .map((lang) => FormBuilderFieldOption(
                    value: lang,
                    child: Text(lang),
                  ))
              .toList(growable: false),
          controlAffinity: ControlAffinity.leading,
          orientation: OptionsOrientation.vertical,
        ));
      }
    }

    return listWidget;
  }

  _CoreFormState(this.formGeneral);

  void _handleChanged() {
    widget.onChanged(formGeneral);
  }

  void onChange(int position, dynamic value) {
    // print("_formKey");
    // print(_formKey.currentState?.fields['lastCompany']);

    this.setState(() {
      formGeneral['fields'][position]['value'] = value;
      this._handleChanged();
    });
  }

  final _formKey = GlobalKey<FormBuilderState>();
  // String question = "";

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              // Text(question),
              FormBuilder(
                  key: _formKey,
                  // enabled: false,
                  autovalidateMode:
                      formGeneral['autoValidated'] ?? AutovalidateMode.disabled,
                  skipDisabled: true,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: jsonToForm(),
                  )),
              RoundedButtonWidget(
                buttonText: 'Continue',
                onPressed: () {
                  // Responsibilities of Screen's form submit
                  // 1. update model => assignMark
                  // 2. call widget.onSubmitSave()

                  //TODO: Write better success and faliure on submit button clicked
                  if (_formKey.currentState?.saveAndValidate() ?? false) {
                    List fields = formGeneral['fields'];

                    fields.forEach((field) {
                      String name = field['name'];

                      String ans = _formKey.currentState.fields[name].value;

                      print("asdasd $name >> $field >> $ans");

                      // Assign mark to answers
                      context.read<ExamEvaluateModal>().assignMark(field, ans);

                      print(context
                          .read<ExamEvaluateModal>()
                          .question_answer_mark);

                      // INFO: Works but not a good place to declare
                      // final model = Provider.of<ExamEvaluateModal>(context);
                      // print("mode l $model");
                    });

                    // On submit button pressed
                    widget.onSubmitSave(context);
                  } else {
                    print(_formKey.currentState?.value);
                    print('validation failed');
                  }
                },
              ),
            ]),
      ),
    );
  }
}
