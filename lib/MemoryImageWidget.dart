import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_image_widget/image_string.dart';

class MemoryImageWidget extends StatelessWidget {

  String base64Image;

  MemoryImageWidget(base64Image="")

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