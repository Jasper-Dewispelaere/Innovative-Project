class Dog {
  final String id;
  final String name;
  final String breed;
  final String sex;
  final String dateOfBirth;
  final String image;
  final String color;

  Dog({ required this.id, required this.name, required this.breed, required this.sex, required this.dateOfBirth, required this.image,
      required this.color});

  factory Dog.fromJson(Map<String, dynamic> json) {
  return Dog(
    id: json['id'],
    name: json['name'],
    breed: json['breed'],
    sex: json['sex'],
    dateOfBirth: json['dateOfBirth'],
    image: json['image'],
    color: json['color'],
  );
}


  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'name': name,
        'breed': breed,
        'sex': sex,
        'dateOfBirth': dateOfBirth,
        'image': image,
        'color': color,
      };
}
