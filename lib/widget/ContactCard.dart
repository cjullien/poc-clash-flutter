import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:adress_book/models/Person.dart';
import 'package:adress_book/widget/TextButtonConditional.dart';
import 'package:adress_book/widget/MemoryImageWidget.dart';

class ContactCard extends StatelessWidget {
  final Person person;
  Widget imageContainer = null;

  ContactCard(this.person) {
    imageContainer = MemoryImageWidget(person.picture);
  }

  _launchPhoneURL(String phoneNumber) async {
    String url = 'tel:' + phoneNumber;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchMailURL(String email) async {
    String url = 'mailto:' + email + '?subject=<subject>&body=<body>';
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
        borderSide: BorderSide(color: Colors.blueGrey),
      ),
      elevation: 8,
      child: Container(
        child: Expanded(
          child: Container(
            alignment: Alignment.topLeft,
            child: Column(
              children: [
                ListTile(
                  title: Text(person.firstname),
                  subtitle: Text(person.name),
                ),
                imageContainer,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButtonConditional(person.phone, "Phone", () => _launchPhoneURL(person.phone)),
                    TextButtonConditional(person.email, "email", () => _launchMailURL(person.email)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
