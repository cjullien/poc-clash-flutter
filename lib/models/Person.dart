import 'dart:convert';

class Person {
  Person({this.firstname = "", this.name = "", this.email = "", this.phone = "", this.picture = ""});

  final String firstname;
  final String name;
  final String email;
  final String phone;
  final String picture;

  Map<String, dynamic> toJson() => _$PersonToJson(this);

  String getJsonElement(element) => element == null ? "" : element;

  factory Person.fromJson(Map<String, dynamic> json) => Person(
        firstname: json['username'] as String,
        name: json['name'],
        email: json['email'],
        phone: json['phone'],
        picture: json.containsKey('picture') ? json['picture'] : "",
      );

  Map<String, dynamic> _$PersonToJson(Person instance) => <String, dynamic>{
        'firstname': instance.firstname,
        'name': instance.name,
        'email': instance.email,
        'phone': instance.phone,
        'picture': instance.picture,
      };
}

// To parse this JSON data, do
//
//     final usershal = usershalFromJson(jsonString);

Usershal usershalFromJson(String str) => Usershal.fromJson(json.decode(str));

String usershalToJson(Usershal data) => json.encode(data.toJson());

class Usershal {
  Usershal({
    this.embedded,
  });

  late Embedded embedded;

  factory Usershal.fromJson(Map<String, dynamic> json) => Usershal(
        embedded: Embedded.fromJson(json["_embedded"]),
      );

  Map<String, dynamic> toJson() => {
        "_embedded": embedded.toJson(),
      };
}

class Embedded {
  Embedded({
    this.users,
  });

  List<Person> users;

  factory Embedded.fromJson(Map<String, dynamic> json) => Embedded(
        users: List<Person>.from(json["users"].map((x) => Person.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "users": List<dynamic>.from(users.map((x) => x.toJson())),
      };
}
