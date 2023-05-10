import 'package:dog_management/models/dog.dart';

class DogMockService{
  var dogs = [
        Dog(1, "Amy", "Jack Russel", "Female", DateTime.parse("2021-10-15"), "White"),
        Dog(2, "Fonzie", "Jack Russel", "Male", DateTime.parse("2019-04-13"), "Black"),
        Dog(3, "Scooby-Doo", "Great Dane", "Male", DateTime.parse("1969-09-13"), "Brown"),
        Dog(4, "Lassie", "Scottish Collie", "Male", DateTime.parse("1954-09-12"), "White"),
        Dog(5, "Cheddar", "Welsh Corgi", "Male", DateTime.parse("2016-03-01"), "Brown"),
      ];
  List<Dog> getAllDogs(){
    return dogs;
  }

  void addDog(Dog addDog)
  {
    dogs.add(addDog);
  }
}