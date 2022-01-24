class Person {
  final String firstname;
  final String name;
  final String email;
  final String phone;
  final String picture;

  const Person({this.firstname = "", this.name = "", this.email = "", this.phone = "", this.picture = ""});

  factory Person.fromJson(Map<String, dynamic> json) {
    String picture2 = json['picture'] == null ? null : json['picture'];
    return Person(
      firstname: json['username'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      picture: picture2,
    );
  }

  /*toString() {
    return "Person { firstname: $firstname , name: $name, email: $email }";
  }*/
}
