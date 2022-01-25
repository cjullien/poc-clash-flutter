import 'package:json_annotation/json_annotation.dart';

class Person {
  Person(this.firstname, this.name, this.email, this.phone, this.picture);

  final String firstname;
  final String name;
  final String email;
  final String phone;
  final String picture;

  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);

  Map<String, dynamic> toJson() => _$PersonToJson(this);

  Person _$PersonFromJson(Map<String, dynamic> json) => Person(
        firstname: json['firstname'] as String,
        name: json['name'] as String,
        email: json['email'] as String,
        phone: json['phone'] as String,
        picture: json['picture'] == null ? null : picture as String,
      );

  Map<String, dynamic> _$PersonToJson(Person instance) => <String, dynamic>{
        'firstname': instance.firstname,
        'name': instance.name,
        'email': instance.email,
        'phone': instance.phone,
        'picture': instance.picture,
      };
}
