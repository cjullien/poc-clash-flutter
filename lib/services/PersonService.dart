import 'dart:async';

import 'package:adress_book/models/Person.dart';
import 'package:adress_book/utils/FuturGeneric.dart';

class PersonService {
  late Future<dynamic> futureDynamic = Future<dynamic>.delayed(
    const Duration(seconds: 1),
    () => fetchDynamic(),
  );

  PersonService() {}

  List<Person> getData() {
    final List<Person> persons = [];
    futureDynamic
        .then((resultList) => () {
              persons.add(Person(name: "test2"));
              persons.addAll(List<Person>.from(resultList.map((model) => Person.fromJson(model))));
            })
        .catchError((error) {
      //errorMsg = error.toString();
      throw error;
    });
    return persons;
  }
}
