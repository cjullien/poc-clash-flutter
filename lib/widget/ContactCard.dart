import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:adress_book/models/Person.dart';
import 'package:adress_book/widget/TextButtonConditional.dart';
import 'package:adress_book/widget/MemoryImageWidget.dart';

class ContactCard extends StatelessWidget {
  final Person person;
  late Widget imageContainer;

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
    return Dismissible(
        key: UniqueKey(),
        child: Card(
          shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Colors.blueGrey),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
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
                  const SizedBox(width: 8),
                  TextButtonConditional(person.email, "email", () => _launchMailURL(person.email)),
                  const SizedBox(width: 8),
                ],
              ),
            ],
          ),
        ),
        // Provide a function that tells the app
        // what to do after an item has been swiped away.
        onDismissed: (direction) {
          // Remove the item from the data source.
          /* setState(() {
            items.removeAt(index);
          });*/

          // Then show a snackbar.
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$item dismissed')));
        },
        // Show a red background as the item is swiped away.
        background: Container(color: Colors.red));
  }
}
