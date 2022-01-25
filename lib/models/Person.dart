class Person {
  Person({this.firstname = "", this.name = "", this.email = "", this.phone = "", this.picture = ""});

  final String firstname;
  final String name;
  final String email;
  final String phone;
  final String picture;

  Map<String, dynamic> toJson() => _$PersonToJson(this);

  String getJsonElement(element) => element == null ? "" : element;

  factory Person.fromJson(Map<String, dynamic> json) {
    String pictureOrEmpty = "";
    try {
      pictureOrEmpty = ""; //json['picture'];
    } catch (error) {
      pictureOrEmpty = "";
    }
    return Person(
      firstname: json['username'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      picture: pictureOrEmpty,
    );
  }

  Map<String, dynamic> _$PersonToJson(Person instance) => <String, dynamic>{
        'firstname': instance.firstname,
        'name': instance.name,
        'email': instance.email,
        'phone': instance.phone,
        'picture': instance.picture,
      };
}
