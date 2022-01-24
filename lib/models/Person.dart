class Person {
  final String firstname;
  final String name;
  final String email;
  final String phone;
  final String picture;

  const Person({this.firstname = "", this.name = "", this.email = "", this.phone = "", this.picture = ""});

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      firstname: json['username'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      picture: json['picture'] == null ? null : json['picture'],
    );
  }

  /*toString() {
    return "Person { firstname: $firstname , name: $name, email: $email }";
  }*/
}
