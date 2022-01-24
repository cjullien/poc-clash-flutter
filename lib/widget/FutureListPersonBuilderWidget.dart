import 'dart:async';

import 'package:flutter/material.dart';

import 'package:adress_book/models/Person.dart';
import 'package:adress_book/utils/FuturGeneric.dart';
import 'package:adress_book/widget/ContactCard.dart';
import 'package:adress_book/main.dart';

class FutureListPersonBuilderWidget extends StatefulWidget {
  final List<Person> persons;
  final State _state;

  late Future<dynamic> futureDynamic = Future<dynamic>.delayed(
    const Duration(seconds: 1),
    () => fetchDynamic(),
  );

  State createState() => _state;

  FutureListPersonBuilderWidget(this.persons, this._state) {
    futureDynamic = fetchDynamic();
    getData();
  }

  void getData() {
    futureDynamic
        .then((resultList) => setState(() {
              persons.add(Person(name: "test2"));
              persons.addAll(List<Person>.from(resultList.map((model) => Person.fromJson(model))));
            }))
        .catchError((error) {
      //errorMsg = error.toString();
      throw error;
    });
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
