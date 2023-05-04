class Dog {
  final String name;
  //final Image picture;
  final String breed;
  final String sex;
  final DateTime dateOfBirth;
  final String color;

  Dog(this.name, /*this.picture,*/ this.breed, this.sex, this.dateOfBirth,
      this.color);

  // factory Dog.fromJson(Map<String, dynamic> json) => Dog(
  //     json['name'] as String,
  //     json['breed'] as String,
  //     json['sex'] as String,
  //     DateTime.parse(json['dateOfBirth'] as String),
  //     json['color'] as String,
  //   );

    Dog.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        breed = json['breed'],
        sex = json['sex'],
        dateOfBirth = DateTime.parse(json['dateOfBirth'] as String),
        color = json['color'];

  Map<String, dynamic> toJson() => <String, dynamic>{
      'name': name,
      'breed': breed,
      'sex': sex,
      'dateOfBirth': dateOfBirth.toIso8601String(),
      'color': color,
    };
}
