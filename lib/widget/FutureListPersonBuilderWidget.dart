import 'dart:async';

import 'package:flutter/material.dart';

import 'package:adress_book/models/Person.dart';
import 'package:adress_book/widget/ContactCard.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

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
          return StaggeredGrid.count(
            crossAxisCount: 6,
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
            children: persons
                .map(
                  (p) => StaggeredGridTile.count(
                    crossAxisCellCount: (MediaQuery.of(context).size.width ~/ 300.0),
                    mainAxisCellCount: 2, //MediaQuery.of(context).size.height as int,
                    child: ContactCard(p),
                  ),
                )
                .toList(),
          );
        });
  }
}
