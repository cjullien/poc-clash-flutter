import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:adress_book/models/Person.dart';
import 'package:adress_book/widget/TextButtonConditional.dart';
import 'package:adress_book/widget/MemoryImageWidget.dart';

class ContactCard extends StatelessWidget {
  final Person person;

  ContactCard(this.person) {}

  _launchPhoneURL(String phoneNumber) async {
    String url = 'tel:' + phoneNumber;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.black,
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: Colors.white),
      ),
      elevation: 8,
      margin: EdgeInsets.all(10),
      child: Container(
        //height: 100,
        //width: 400,
        color: Colors.white,
        child: Row(
          children: [
            Expanded(
              child: Text(person.name),
              flex: 8,
            ),
          ],
        ),
      ),
    );
  }
}
