import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class MyTextField extends StatefulWidget {
  MyTextField({Key key}) : super(key: key);

  @override
  _TextFieldState createState() => _TextFieldState();
}

class _TextFieldState extends State<MyTextField> {
  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      autovalidateMode: AutovalidateMode.always,
      name: 'name',
      decoration: InputDecoration(
        labelText: 'Name',
        border: OutlineInputBorder(),
      ),
      onChanged: (val) {
        print('onChanged');
        // setState(() {
        //   _nameHasError = !(_formKey
        //           .currentState?.fields['name']
        //           ?.validate() ??
        //       false);
        // });
      },
      // valueTransformer: (text) => num.tryParse(text),
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(context),
        FormBuilderValidators.max(context, 100),
      ]),
      // initialValue: '12',
      keyboardType: TextInputType.name,
      textInputAction: TextInputAction.next,
    );
  }
}
