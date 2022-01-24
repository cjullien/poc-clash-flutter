import 'dart:async';

import 'package:flutter/material.dart';

import 'package:adress_book/models/Person.dart';
import 'package:adress_book/utils/FuturGeneric.dart';
import 'package:adress_book/widget/ContactCard.dart';

class FutureListPersonBuilderWidget extends StatelessWidget {
  late final Future<dynamic> futureDynamic;
  final List<Person> persons;

  FutureListPersonBuilderWidget(this.persons) {
    futureDynamic = fetchDynamic();
  }

  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
        future: futureDynamic,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          return ListView(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            children: persons
                .map(
                  (p) => ContactCard(p),

                  /* Text.rich(
                                TextSpan(
                                  text: ' - ', // default text style
                                  children: <InlineSpan>[
                                    TextSpan(text: '${p.firstname} ', style: TextStyle(fontStyle: FontStyle.italic)),
                                    TextSpan(text: '${p.name}', style: TextStyle(fontWeight: FontWeight.bold)),
                                    WidgetSpan(
                                      child: Icon(Icons.email_outlined),
                                    ),
                                  ],
                                ),
                              ),*/
                )
                .toList(),
          );
        });
  }
}
