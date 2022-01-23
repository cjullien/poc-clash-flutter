import 'dart:convert';
import 'package:flutter/material.dart';

class MemoryImageWidget extends StatelessWidget {

  final String base64Image;

  const MemoryImageWidget({this.base64Image=""})

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Memory Image'),
      ),
      body: Container(
        color: Colors.white,
        child: Image.memory(
          base64Decode(base64Image),
        ),
      ),
    );
  }
}