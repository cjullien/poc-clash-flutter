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
        appBar: MyAppBar(),
        body: FutureListPersonBuilderWidget(persons, futureDynamic),
      ),
    );
  }
}

class MyAppBar extends AppBar {

  MyAppBar() {}

  Widget build(BuildContext context) {
    return AppBar(
          leading: Icon(Icons.menu),
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
          backgroundColor: Colors.grey,
        )
  }
}
