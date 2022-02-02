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
            padding: const EdgeInsets.all(0),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: (MediaQuery.of(context).size.width ~/ 300),
            children: persons
                .map((p) => Dismissible(
                      key: UniqueKey(),
                      child: ContactCard(p),
                      // Provide a function that tells the app
                      // what to do after an item has been swiped away.
                      confirmDismiss: (direction) async {
                        if (direction == DismissDirection.startToEnd) {
                          /// edit item
                          // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${person.name} edit')));
                          return false;
                        } else if (direction == DismissDirection.endToStart) {
                          /// delete
                          persons.remove(p);
                          //ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${person.name} dismissed')));
                          return true;
                        }
                      },
                      // Show a red background as the item is swiped away.
                      background: Container(color: Colors.green),
                      secondaryBackground: Container(color: Colors.red),
                    ))
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
