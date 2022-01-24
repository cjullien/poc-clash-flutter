class Person {
  final String firstname;
  final String name;
  final String email;
  final String phone;

  const Person({this.firstname = "", this.name = "", this.email = "", this.phone = ""});

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      firstname: json['username'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
    );
  }

  /*toString() {
    return "Person { firstname: $firstname , name: $name, email: $email }";
  }*/
}
