class Dog {
  final int id;
  final String name;
  //final Image picture;
  final String breed;
  final String sex;
  final DateTime dateOfBirth;
  final String color;

  Dog(this.id, this.name, /*this.picture,*/ this.breed, this.sex, this.dateOfBirth,
      this.color);

    Dog.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        breed = json['breed'],
        sex = json['sex'],
        dateOfBirth = DateTime.parse(json['dateOfBirth'] as String),
        color = json['color'];

  Map<String, dynamic> toJson() => <String, dynamic>{
      'id': id,
      'name': name,
      'breed': breed,
      'sex': sex,
      'dateOfBirth': dateOfBirth.toIso8601String(),
      'color': color,
    };
}
