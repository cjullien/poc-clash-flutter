import 'dart:async';

import 'package:flutter/material.dart';

import 'package:adress_book/services/PersonService.dart';
import 'package:adress_book/models/Person.dart';
import 'package:adress_book/utils/FuturGeneric.dart';
import 'package:adress_book/utils/Constantes.dart' as _constantes;
import 'widget/FutureListPersonBuilderWidget.dart';
//import 'widget/MemoryImageWidget.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Person> persons = [
    Person(name: "test1")
  ];

  _MyAppState() {
    persons.addAll(PersonService().getData());
    getData();
    super.initState();
  }

  late Future<dynamic> futureDynamic = Future<dynamic>.delayed(
    const Duration(seconds: 1),
    () => fetchDynamic(),
  );

  void getData() {
    futureDynamic
        .then((resultList) => setState(() {
              persons.add(Person(name: "test2"));
              persons.addAll(List<Person>.from(resultList.map((model) => Person.fromJson(model))));
            }))
        .catchError((error) {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: _constantes.App.title,
        home: Scaffold(
            appBar: AppBar(
              title: const Text(_constantes.App.title),
            ),
            body: Center(child: FutureListPersonBuilderWidget(persons))));
  }
}
