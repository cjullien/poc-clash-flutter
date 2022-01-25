import 'package:json_annotation/json_annotation.dart';

//part 'person.g.dart';

@JsonSerializable()
class Person {
  Person(this.firstname, this.name, this.email, this.phone, this.picture);

  @JsonKey(fromJson: _dataFromJson, toJson: _dataToJson)
  final String firstname;
  @JsonKey(fromJson: _dataFromJson, toJson: _dataToJson)
  final String name;
  @JsonKey(fromJson: _dataFromJson, toJson: _dataToJson)
  final String email;
  @JsonKey(fromJson: _dataFromJson, toJson: _dataToJson)
  final String phone;
  @JsonKey(fromJson: _dataFromJson, toJson: _dataToJson)
  final String picture = "";

  factory Person.fromJson(Map<String, dynamic> json) => _dataFromJson(json);

  Map<String, dynamic> toJson() => _dataToJson(this);

  /*toString() {
    return "Person { firstname: $firstname , name: $name, email: $email }";
  }*/
}

T _dataFromJson<T>(Map<String, dynamic> input) => input['value'] as T;

Map<String, dynamic> _dataToJson<T>(T input) => {
      'value': input
    };
