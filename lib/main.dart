import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

import 'Constantes.dart' as _constantes;
import 'Person.dart';
import 'FuturGeneric.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<dynamic> futureDynamic = Future<dynamic>.delayed(
    const Duration(seconds: 4),
    () => fetchDynamic(),
  );
  final List<Person> persons = [];
  String errorMsg = "";

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
                              (p) => Card(
                                child: Container(
                                  height: 100,
                                  color: Colors.white,
                                  child: Row(
                                    children: [
                                      Center(
                                        child: Padding(
                                          padding: EdgeInsets.all(10),
                                          child: Expanded(
                                            child: Image.asset("assets/images/shape_of_you.png"),
                                            flex: 2,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          alignment: Alignment.topLeft,
                                          child: Column(
                                            children: [
                                              Expanded(
                                                flex: 5,
                                                child: ListTile(
                                                  title: Text("Shape Of You"),
                                                  subtitle: Text("Ed Sheeran"),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 5,
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                  children: [
                                                    TextButton(
                                                      child: Text("PLAY"),
                                                      onPressed: () {},
                                                    ),
                                                    SizedBox(
                                                      width: 8,
                                                    ),
                                                    TextButton(
                                                      child: Text("ADD TO QUEUE"),
                                                      onPressed: () {},
                                                    ),
                                                    SizedBox(
                                                      width: 8,
                                                    )
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
                              ),

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
