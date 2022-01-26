import 'dart:async';

import 'package:flutter/material.dart';

import 'package:adress_book/models/Person.dart';
import 'package:adress_book/widget/ContactCard.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';

class FutureListPersonBuilderWidget extends StatelessWidget {
  final List<Person> persons;

  late final Future<dynamic> futureDynamic;

  FutureListPersonBuilderWidget(this.persons, this.futureDynamic) {}

  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
      future: futureDynamic,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return /*BootstrapContainer(
          fluid: true,
          children: persons
              .map(
                (p) => BootstrapCol(
                  sizes: 'col-12 col-xs-12 col-sm-6 col-lg-4 col-xl-3',
                  child: ContactCard(p),
                ),
              )
              .toList(),
        );*/
            GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: (MediaQuery.of(context).size.width ~/ 400),
          children: persons.map((p) => Container(child: ContactCard(p))).toList(),
        );
      },
    );
  }
}
