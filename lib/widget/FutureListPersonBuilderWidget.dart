import 'dart:async';

import 'package:flutter/material.dart';

import 'package:adress_book/models/Person.dart';
import 'package:adress_book/widget/ContactCard.dart';
import 'package:responsive_grid/responsive_grid.dart';

class FutureListPersonBuilderWidget extends StatelessWidget {
  final List<Person> persons;

  late final Future<dynamic> futureDynamic;

  FutureListPersonBuilderWidget(this.persons, this.futureDynamic) {}

  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
      future: futureDynamic,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return ResponsiveGridRow(
          children: persons
              .map(
                (p) => ResponsiveGridCol(
                  xs: 12,
                  md: 6,
                  lg: 3,
                  child: ContactCard(p),
                ),
              )
              .toList(),
        );
      },
    );
  }
}
