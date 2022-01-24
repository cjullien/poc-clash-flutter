import 'dart:async';

import 'package:flutter/material.dart';

import 'models/Person.dart';
import 'utils/FuturGeneric.dart';
import 'package:adress_book/utils/Constantes.dart' as _constantes;
import 'widget/ContactCard.dart';
//import 'widget/MemoryImageWidget.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<dynamic> futureDynamic = Future<dynamic>.delayed(
    const Duration(seconds: 1),
    () => fetchDynamic(),
  );
  final List<Person> persons = [
    Person(name: "test1")
  ];
  String errorMsg = "";

  _MyAppState() {
    getData();
    super.initState();
  }

  void getData() {
    futureDynamic
        .then((resultList) => setState(() {
              persons.add(Person(name: "test2"));
              persons.addAll(List<Person>.from(resultList.map((model) => Person.fromJson(model))));
            }))
        .catchError((error) {
      errorMsg = error.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: _constantes.App.title,
        home: Scaffold(
            appBar: AppBar(
              title: const Text(_constantes.App.title),
            ),
            body: Center(
                child: FutureBuilder<dynamic>(
                    future: futureDynamic,
                    builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                      return ListView(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        children: persons
                            .map(
                              (p) => ContactCard(p),

                              /* Text.rich(
                                TextSpan(
                                  text: ' - ', // default text style
                                  children: <InlineSpan>[
                                    TextSpan(text: '${p.firstname} ', style: TextStyle(fontStyle: FontStyle.italic)),
                                    TextSpan(text: '${p.name}', style: TextStyle(fontWeight: FontWeight.bold)),
                                    WidgetSpan(
                                      child: Icon(Icons.email_outlined),
                                    ),
                                  ],
                                ),
                              ),*/
                            )
                            .toList(),
                      );
                    }))));
  }
}

/*class MyFuturWidget extends StatelessWidget {
  late Future<dynamic> futureDynamic;

  MyFuturWidget() {
    futureDynamic = fetchDynamic();
  }

  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
      future: futureDynamic,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var resultList = List<Map<String, dynamic>>.from(snapshot.data);
          persons.addAll(resultList.map((Map<String, dynamic> p) {
            return Person.fromJson(p);
          }).toList());
          return Text('personne2 : $persons');
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        return const CircularProgressIndicator();
      },
    );
  }
}*/
