import 'dart:async';

import 'package:flutter/material.dart';

import 'package:adress_book/models/Person.dart';
import 'package:adress_book/widget/ContactCard.dart';

class FutureListPersonBuilderWidget extends StatelessWidget {
  final List<Person> persons;

  late final Future<dynamic> futureDynamic;

  FutureListPersonBuilderWidget(this.persons, this.futureDynamic) {}

  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
      future: futureDynamic,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return GridView.count(
            primary: false,
            padding: const EdgeInsets.all(20),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: (MediaQuery.of(context).size.width ~/ 300),
            children: persons
                .map((p) => {
                      return ContactCard(p)
                    })
                .toList(),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(
              valueColor: new AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
          );
        }
      },
    );
  }
}
