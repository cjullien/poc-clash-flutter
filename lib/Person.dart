class Person {
  final String firstname;
  final String name;
  final String email;

  const Person({this.firstname = "", this.name = "", this.email = ""});

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      firstname: json['username'],
      name: json['name'],
      email: json['email'],
    );
  }

  toString() {
    return "Person { firstname: $firstname , name: $name, email: $email }";
  }
}
