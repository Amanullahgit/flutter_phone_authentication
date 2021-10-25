import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:meta/meta.dart';

class JsonSchema extends StatefulWidget {
  const JsonSchema({
    @required this.form,
    @required this.onChanged,
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
  final ValueChanged<dynamic> onChanged;
  final AutovalidateMode autovalidateMode;

  @override
  _CoreFormState createState() =>
      new _CoreFormState(formMap ?? json.decode(form));
}

class _CoreFormState extends State<JsonSchema> {
  final dynamic formGeneral;

  var locationOptions = ['Bengalure', 'Delhi', 'Mumbai', 'Chennai', 'Kolkata'];
  bool _locationHasError = false;

  int radioValue;

  // List<FormFieldValidator> validators() {
  //   List<FormFieldValidator> listValidator = [];
  //   if (formGeneral?.validation?.required) {

  //   }
  // }

  List<Widget> jsonToForm() {
    List<Widget> listWidget = new List<Widget>();
    if (formGeneral['title'] != null) {
      listWidget.add(Text(
        formGeneral['title'],
        style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
      ));
    }
    if (formGeneral['description'] != null) {
      listWidget.add(Text(
        formGeneral['description'],
        style: new TextStyle(fontSize: 14.0, fontStyle: FontStyle.italic),
      ));
    }

    for (var count = 0; count < formGeneral['fields'].length; count++) {
      listWidget.add(const SizedBox(height: 15));

      Map item = formGeneral['fields'][count];

      if (item['type'] == "TextInput") {
        listWidget.add(new FormBuilderTextField(
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
        print("optiuons  >> $item");
        // dynamic op = List<String>(item['options']);
        listWidget.add(FormBuilderDropdown<String>(
          // autovalidate: true,
          name: item['name'],
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
              _locationHasError =
                  !(_formKey.currentState?.fields['location']?.validate() ??
                      false);
            });
          },
          valueTransformer: (val) => val?.toString(),
        ));
      }
    }

    if (widget.buttonSave != null) {
      listWidget.add(new Container(
        margin: EdgeInsets.only(top: 10.0),
        child: InkWell(
          onTap: () {
            if (_formKey.currentState.validate()) {
              widget.actionSave(formGeneral);
            }
          },
          child: widget.buttonSave,
        ),
      ));
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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(children: <Widget>[
        FormBuilder(
            key: _formKey,
            // enabled: false,
            autovalidateMode:
                formGeneral['autoValidated'] ?? AutovalidateMode.disabled,
            skipDisabled: true,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: jsonToForm(),
            )),
        MaterialButton(
          color: Theme.of(context).colorScheme.secondary,
          onPressed: () {
            if (_formKey.currentState?.saveAndValidate() ?? false) {
              print(_formKey.currentState?.value);
              // Navigator.pushAndRemoveUntil(
              //     context,
              //     MaterialPageRoute(builder: (context) => Home()),
              //     (route) => false);
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
      ]),
    );
  }
}
