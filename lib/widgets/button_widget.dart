import 'package:flutter/material.dart';

class RoundedButtonWidget extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;

  const RoundedButtonWidget({
    Key key,
    @required this.buttonText,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 35.0,
      minWidth: 370.0,
      color: Theme.of(context).primaryColor,
      textColor: Colors.white,
      child: new Text(buttonText),
      onPressed: onPressed,
      splashColor: Colors.deepPurple[300],
    );
  }
}
