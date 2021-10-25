import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'function.dart';

class MyTextField extends StatefulWidget {
  MyTextField({
    Key key,
    @required this.item,
    @required this.onChange,
    @required this.position,
    this.errorMessages = const {},
    this.validations = const {},
    this.decorations = const {},
    this.keyboardTypes = const {},
  }) : super(key: key);

  final dynamic item;
  final Function onChange;
  final int position;
  final Map errorMessages;
  final Map validations;
  final Map decorations;
  final Map keyboardTypes;

  @override
  _TextFieldState createState() => _TextFieldState();
}

class _TextFieldState extends State<MyTextField> {
  dynamic item;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    item = widget.item;

    print("item MyTextField $item");
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      controller: null,
      initialValue: item['value'] ?? null,
      autovalidateMode: AutovalidateMode.always,
      name: 'name',
      decoration: item['decoration'] ??
          widget.decorations[item['key']] ??
          new InputDecoration(
            hintText: item['placeholder'] ?? "",
            helperText: item['helpText'] ?? "",
          ),
      onChanged: (value) {
        item['value'] = value;
        widget.onChange(widget.position, value);
        // print('onChanged MyTextField $val');
        // // setState(() {
        // //   _nameHasError = !(_formKey
        // //           .currentState?.fields['name']
        // //           ?.validate() ??
        // //       false);
        // // });
      },
      keyboardType: item['keyboardType'] ??
          widget.keyboardTypes[item['key']] ??
          TextInputType.text,
      // valueTransformer: (text) => num.tryParse(text),
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(context),
        FormBuilderValidators.max(context, 100),
      ]),
      // initialValue: '12',
      textInputAction: TextInputAction.next,
    );
  }
}
