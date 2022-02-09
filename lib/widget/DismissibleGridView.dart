import 'package:flutter/material.dart';

import 'package:adress_book/models/Person.dart';
import 'package:adress_book/widget/ContactCard.dart';

class DismissibleGridView extends StatefulWidget {
  final List<Person> persons;

  DismissibleGridView(this.persons) {}

  @override
  _DismissibleGridView createState() => _DismissibleGridView();
}

class _DismissibleGridView extends State<DismissibleGridView> {
  Widget build(BuildContext context) {
    return GridView.count(
      primary: false,
      padding: const EdgeInsets.all(30),
      crossAxisSpacing: 1,
      mainAxisSpacing: 1,
      crossAxisCount: (MediaQuery.of(context).size.width ~/ 300),
      children: widget.persons
          .map(
            (p) => Dismissible(
              key: UniqueKey(),
              child: ContactCard(p),
              // Provide a function that tells the app
              // what to do after an item has been swiped away.
              onDismissed: (direction) {
                if (direction == DismissDirection.startToEnd) {
                  /// edit item

                  final snackBar = SnackBar(
                    behavior: SnackBarBehavior.floating,
                    content: Text('TODO - edition de { ${p.name} }'),
                    /*action: SnackBarAction(
                      label: 'Action',
                      onPressed: () {},
                    ),*/
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                } else if (direction == DismissDirection.endToStart) {
                  final snackBar = SnackBar(
                    behavior: SnackBarBehavior.floating,
                    content: Text('Suppression de { ${p.name} }'),
                  );
                  if (this.mounted) {
                    setState(() => widget.persons.remove(p));
                  }
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);

                  /// delete
                  //ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${person.name} dismissed')));
                }
              },
              // Show a red background as the item is swiped away.
              background: Container(
                alignment: Alignment.centerLeft,
                child: Icon(
                  Icons.edit,
                  size: 40,
                ),
              ),
              secondaryBackground: Container(
                alignment: Alignment.centerRight,
                child: Icon(
                  Icons.delete,
                  size: 40,
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
