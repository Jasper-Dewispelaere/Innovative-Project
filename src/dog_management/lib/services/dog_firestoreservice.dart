// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/dog.dart';

class DogFirestoreService {
  final _db = FirebaseFirestore.instance;
  var alldogs = [];

  Future<List<dynamic>> allDogs() async {
    _db.collection("dogs").get().then(
      (querySnapshot) {
        print("Successfully completed");
        for (var docSnapshot in querySnapshot.docs) {
          alldogs.add(
            {'data': docSnapshot.data(), 'id': docSnapshot.id}
          );
          print(' id: ${docSnapshot.id} => ${docSnapshot.data()}');
        }
      },
      onError: (e) => print("Error completing: $e"),
    );
    return alldogs;
  }

  Future<Dog> getDogDetails(String name) async {
    final snapshot =
        await _db.collection("dogs").where("name", isEqualTo: name).get();
    final dogData = snapshot.docs.map((e) => Dog.fromSnapshot(e)).single;
    return dogData;
  }

  void deleteDog(dynamic id) async {
    _db.collection("dogs").doc(id).delete().then(
      (doc) => print("Document deleted"),
      onError: (e) => print("Error updating document $e"),
      );
  }

  void getAllData() {
    _db.collection("dogs").get().then(
      (querySnapshot) {
        print("Successfully completed");
        for (var docSnapshot in querySnapshot.docs) {
          print('${docSnapshot.id} => ${docSnapshot.data()}');
        }
      },
      onError: (e) => print("Error completing: $e"),
    );
  }
}
