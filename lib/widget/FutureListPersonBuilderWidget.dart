import 'dart:async';

import 'package:flutter/material.dart';

import 'package:adress_book/models/Person.dart';
import 'package:adress_book/widget/ContactCard.dart';
import 'package:responsive_grid/responsive_grid.dart';

class FutureListPersonBuilderWidget extends StatelessWidget {
  final List<Person> persons;

  late final Future<dynamic> futureDynamic;

  FutureListPersonBuilderWidget(this.persons, this.futureDynamic) {}

  /*     StaggeredGrid.count(
            crossAxisCount: 4,
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
            children: const [
              StaggeredGridTile.count(
                crossAxisCellCount: 2,
                mainAxisCellCount: 2,
                child: Text("A"),
              ),
            ],
          ),*/

  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
        future: futureDynamic,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          return ResponsiveGridRow(
            children: [
              ContactCard(new Person(name: "name")),
              persons
                  .map(
                    (p) => ResponsiveGridCol(
                      xs: 12,
                      md: 6,
                      lg: 3,
                      child: ContactCard(p),
                    ),
                  )
                  .toList()
            ],
          );
        });
  }
}
