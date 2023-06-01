import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class Dog {
  final String? id;
  final String name;
  final String breed;
  final String sex;
  final String dateOfBirth;
  final String image;
  final String color;
  final List<dynamic> walks;

  Dog(
      {required this.id,
      required this.name,
      required this.breed,
      required this.sex,
      required this.dateOfBirth,
      required this.image,
      required this.color,
      required this.walks});

  factory Dog.fromJson(Map<String, dynamic> json) {
    return Dog(
      id: json['id'],
      name: json['name'],
      breed: json['breed'],
      sex: json['sex'],
      dateOfBirth: json['dateOfBirth'],
      image: json['image'],
      color: json['color'],
      walks: json['walks'],
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
        'walks': walks
      };
  factory Dog.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return Dog(
      id: document.id,
      name: data["name"],
      breed: data["breed"],
      sex: data["gender"],
      dateOfBirth: data["dateOfBirth"],
      image: data["image"],
      color: data["color"],
      walks: data["walks"],
    );
  }
}
