import 'dart:core';

import 'package:dog_management/models/dog.dart';

class dogMockService{
  Future <List<Dog>> getAllDogs() async{
    final dogs = [
      Dog("Amy", "Jack Russel", "Female", DateTime.parse("2021/10/15"), "White"),
      Dog("Fonzie", "Jack Russel", "Male", DateTime.parse("2019/04/13"), "Black"),
      Dog("Scooby-Doo", "Great Dane", "Male", DateTime.parse("1969/09/13"), "Brown"),
      Dog("Lassie", "Scottish Collie", "Male", DateTime.parse("1954/09/12"), "White"),
      Dog("Cheddar", "Pembroke Welsh Corgi", "Male", DateTime.parse("2016/03/1"), "Brown"),
    ];

    return dogs;
  }
}