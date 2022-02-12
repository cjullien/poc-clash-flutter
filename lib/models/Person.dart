class Person {
  Person({this.id = 0, this.firstname = "", this.name = "", this.email = "", this.phone = "", this.isDev = false, this.picture = ""});

  final int id;
  final String firstname;
  final String name;
  final String email;
  final String phone;
  final bool isDev;
  final String picture;

  Map<String, dynamic> toJson() => _$PersonToJson(this);

  String getJsonElement(element) => element == null ? "" : element;

  factory Person.fromJson(Map<String, dynamic> json) => Person(
        id: json['id'],
        firstname: json['firstname'],
        name: json['name'],
        email: json['email'],
        phone: json['phone'],
        isDev: json['dev'],
        picture: json.containsKey('picture') ? json['picture'] : "",
      );

  Map<String, dynamic> _$PersonToJson(Person instance) => <String, dynamic>{
        'id': instance.id,
        'firstname': instance.firstname,
        'name': instance.name,
        'email': instance.email,
        'phone': instance.phone,
        'isDev': instance.isDev,
        'picture': instance.picture,
      };
}
