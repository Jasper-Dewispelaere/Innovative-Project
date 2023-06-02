import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/dog.dart';

class DogFirestoreService {

  final _db = FirebaseFirestore.instance;
  
  Future<List<Dog>> allDogs() async {
    final snapshot = await _db.collection("dogs").get();
    final dogData = snapshot.docs.map((e) => Dog.fromSnapshot(e)).toList();
    return dogData;
  }

  Future<Dog> getDogDetails(String name) async {
    final snapshot = await _db.collection("dogs").where("name", isEqualTo: name).get();
    final dogData = snapshot.docs.map((e) => Dog.fromSnapshot(e)).single;
    return dogData;
  }
}