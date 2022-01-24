import 'package:json_annotation/json_annotation.dart';

part 'person.g.dart';

@JsonSerializable()
class Person {
  Person(this.firstname, this.name, this.email, this.phone, this.picture);

  final String firstname;
  final String name;
  final String email;
  final String phone;
  final String picture;

  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);

  Map<String, dynamic> toJson() => _$PersonToJson(this);

  /*toString() {
    return "Person { firstname: $firstname , name: $name, email: $email }";
  }*/
}
