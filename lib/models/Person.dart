import 'dart:convert';

class Person {
  Person({this.firstname = "", this.name = "", this.email = "", this.phone = "", this.isDev = false, this.picture = ""});

  final String firstname;
  final String name;
  final String email;
  final String phone;
  final bool isDev;
  final String picture;

  Map<String, dynamic> toJson() => _$PersonToJson(this);

  String getJsonElement(element) => element == null ? "" : element;

  factory Person.fromJson(Map<String, dynamic> json) => Person(
        firstname: json['firstname'],
        name: json['name'],
        email: json['email'],
        phone: json['phone'],
        isDev: json['dev'],
        picture: json.containsKey('picture') ? json['picture'] : "",
      );

  Map<String, dynamic> _$PersonToJson(Person instance) => <String, dynamic>{
        'firstname': instance.firstname,
        'name': instance.name,
        'email': instance.email,
        'phone': instance.phone,
        'isDev': instance.isDev,
        'picture': instance.picture,
      };
}
