import 'package:flutter/material.dart';
import 'package:adress_book/models/Person.dart';

class ContactCard extends StatelessWidget {
  final Person person;

  ContactCard(this.person) {}

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 100,
        color: Colors.white,
        child: Row(
          children: [
            /*Center(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Expanded(
                child: MemoryImageWidget(),
                flex: 2,
              ),
            ),
          ),*/
            Expanded(
              child: Container(
                alignment: Alignment.topLeft,
                child: Column(
                  children: [
                    Expanded(
                      flex: 5,
                      child: ListTile(
                        title: Text(person.firstname),
                        subtitle: Text(person.name),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButtonConditional(true),
                          TextButton(
                            child: Text("Phone"),
                            onPressed: () {},
                          ),
                          TextButton(
                            child: Text("email"),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              flex: 8,
            ),
          ],
        ),
      ),
      elevation: 8,
      margin: EdgeInsets.all(10),
    );
  }
}

class TextButtonConditional extends StatelessWidget {
  final bool condition;

  TextButtonConditional(this.condition) {}

  Widget build(BuildContext context) {
    return Text((() {
      if (condition) {
        return "tis true";
      }
      return "anything but true";
    })());
  }
}
