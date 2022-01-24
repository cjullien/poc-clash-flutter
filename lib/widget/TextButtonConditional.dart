import 'package:flutter/material.dart';

class TextButtonConditional extends StatelessWidget {
  final String value;
  final String text;

  TextButtonConditional(this.value, this.text) {}

  Widget build(BuildContext context) {
    if (value.isNotEmpty) {
      return TextButton(
        child: Text(text),
        onPressed: () {},
      );
    }
    return Text("-");
  }
}
