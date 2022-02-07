import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:adress_book/models/Person.dart';
import 'package:adress_book/widget/TextButtonConditional.dart';
import 'package:adress_book/widget/MemoryImageWidget.dart';
import 'package:adress_book/utils/Constantes.dart' as _constantes;

class ContactCard extends StatelessWidget {
  final Person person;
  late final Widget imageContainer;

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
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: _constantes.App.appColor),
      ),
      color: person.isDev ? Colors.redAccent : Colors.green
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: Text(person.name.toUpperCase()),
            subtitle: Text(person.firstname),
          ),
          imageContainer,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButtonConditional(person.phone, "Phone", () => _launchPhoneURL(person.phone)),
              const SizedBox(width: 8),
              TextButtonConditional(person.email, "email", () => _launchMailURL(person.email)),
              const SizedBox(width: 8),
            ],
          ),
        ],
      ),
    );
  }
}
