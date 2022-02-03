import 'dart:async';

import 'package:flutter/material.dart';

import 'package:adress_book/models/Person.dart';
import 'package:adress_book/utils/FuturGeneric.dart';
import 'package:adress_book/utils/Constantes.dart' as _constantes;
import 'widget/FutureListPersonBuilderWidget.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Person> persons = [
    //Person(name: "test1")
  ];
  late final Future<dynamic> futureDynamic = Future<dynamic>.delayed(
    const Duration(seconds: 1),
    () => fetchDynamic(),
  );

  _MyAppState() {
    getData();
    super.initState();
  }

  void getData() {
    futureDynamic
        .then((resultList) => setState(() {
              persons.addAll(List<Person>.from(resultList.map((model) => Person.fromJson(model))));
            }))
        .catchError((error) {
      print(error);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _constantes.App.title,
      home: Scaffold(
        appBar: AppBar(
          //leading: Icon(Icons.menu),
          title: Text(_constantes.App.title),
          actions: [
            IconButton(
              icon: Icon(Icons.person_add_alt),
              onPressed: () {
                final snackBar = SnackBar(
                  behavior: SnackBarBehavior.floating,
                  content: Text('TODO Ajouter une personne'),
                  /*action: SnackBarAction(
                      label: 'Action',
                      onPressed: () {},
                    ),*/
                );
                Scaffold.of(context).showSnackBar(snackBar);
              },
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  final snackBar = SnackBar(
                    behavior: SnackBarBehavior.floating,
                    content: Text('TODO Ajouter une personne'),
                    /*action: SnackBarAction(
                      label: 'Action',
                      onPressed: () {},
                    ),*/
                  );
                  Scaffold.of(context).showSnackBar(snackBar);
                },
              ),
            ),
            Icon(Icons.more_vert),
          ],
          backgroundColor: _constantes.App.appColor,
        ),
        body: FutureListPersonBuilderWidget(persons, futureDynamic),
        drawer: Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: _constantes.App.appColor,
                ),
                child: Text('Drawer Header'),
              ),
              ListTile(
                title: const Text('Item 1'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Item 2'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
