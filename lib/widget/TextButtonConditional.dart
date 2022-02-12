import 'package:flutter/material.dart';

class TextButtonConditional extends StatelessWidget {
  final String value;
  final String text;
  final VoidCallback callBackOnPressed;

  TextButtonConditional(this.value, this.text, this.callBackOnPressed) {}

  Widget build(BuildContext context) {
    if (value.isNotEmpty) {
      return TextButton(
        child: Text(text),
        onPressed: callBackOnPressed,
      );
    }
    return Text("-");
  }
}
