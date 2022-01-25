part of 'Person.dart';

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
