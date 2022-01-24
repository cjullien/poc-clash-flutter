import 'package:json_serializable/json_serializable.dart';

@JsonSerializable()
class Person {
  final String firstname;
  final String name;
  final String email;
  final String phone;
  final String picture;

  const Person({this.firstname = "", this.name = "", this.email = "", this.phone = "", this.picture = ""});

  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);

  /*toString() {
    return "Person { firstname: $firstname , name: $name, email: $email }";
  }*/
}
